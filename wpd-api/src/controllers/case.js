const path = require('path');
const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Case = require('../models/case');
const User = require('../models/user');
const Category = require('../models/category');
const AWS = require('aws-sdk');
const multer = require('multer');
const multerS3 = require('multer-s3');



// const { sendCaseEmail } = require('../utils/send-email');

// @desc      Get all cases
// @route     GET /api/v1/cases
// @route     GET /api/v1/category/:category/cases
// @access    Private
exports.getCases = asyncHandler(async (req, res, next) => {
  if (req.params.category) {
    const cases = await Case.find({ category: req.params.category }).populate('category').sort({ 'title': 1 }).exec();

    return res.status(200).json({
      success: true,
      count: cases.length,
      data: cases,
    });
  } else {
    res.status(200).json(res.advancedResults);
  }
});

// @desc      Get single case
// @route     GET /api/v1/cases/:id
// @access    public
exports.getCase = asyncHandler(async (req, res, next) => {
  let casee = await Case.findById(req.params.id).populate({
    path: 'category',
    select: 'title',
  });

  if (!casee) {
    return next(new ErrorResponse('Please provide correct Case ID', 404));
  }

  res.status(200).json({
    success: true,
    data: casee,
  });
});

// @desc      Get single case by Case Number
// @route     GET /api/v1/cases/number/:caseNumber
// @access    Private
exports.getCaseByCaseNumber = asyncHandler(async (req, res, next) => {
  const casee = await Case.findOne({ caseNumber: req.params.caseNumber });

  if (!casee) {
    return next(new ErrorResponse('Please provide correct Case ID', 404));
  }

  res.status(200).json({
    success: true,
    data: casee,
  });
});

// @desc      Get Case with Police info
// @route     GET /api/v1/cases/:caseId/:userId
// @access    Private
exports.getCaseAndPoliceInfo = asyncHandler(async (req, res, next) => {
  const casee = await Case.findById(req.params.caseId);

  const user = await User.findById(req.params.userId);

  if (!casee || !user) {
    return next(
      new ErrorResponse('Please provide correct Case ID & User ID', 404)
    );
  }

  user.role = undefined;
  user.__v = undefined;
  casee.__v = undefined;

  res.status(200).json({
    success: true,
    data: {
      case: casee,
      user: user,
    },
  });
});

// @desc      Create case
// @route     POST /api/v1/cases
// @access    Private
exports.createCase = asyncHandler(async (req, res, next) => {
  let casee = await Case.create(req.body);

  casee = await Case.findById(casee._id).populate('category');

  res.status(201).json({
    success: true,
    data: casee,
  });
});



// @desc      Update case
// @route     PUT /api/v1/cases/:id
// @access    Private
exports.updateCase = asyncHandler(async (req, res, next) => {
  const casee = await Case.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
  });

  res.status(200).json({
    success: true,
    data: casee,
  });
});

// @desc      Delete case
// @route     DELETE /api/v1/cases/:id
// @access    Private
exports.deleteCase = asyncHandler(async (req, res, next) => {
  await Case.findByIdAndDelete(req.params.id);

  res.status(200).json({
    success: true,
    data: {},
  });
});

// @desc      Send Case email
// @route     POST /api/v1/cases/email
// @access    Private
exports.sendEmail = asyncHandler(async (req, res, next) => {
  await sendCaseEmail({
    email: req.body.email,
    subject: req.body.subject,
    url: req.body.url,
  });

  res.status(200).json();
});




/* Uploading */
const spacesEndpoint = new AWS.Endpoint(process.env.DO_SPACES_ENDPOINT);
const s3 = new AWS.S3({ endpoint: spacesEndpoint, accessKeyId: process.env.DO_SPACES_KEY, secretAccessKey: process.env.DO_SPACES_SECRET });

// Change bucket property to your Space name
// CREATE MULTER FUNCTION FOR UPLOAD
const upload = multer({
  // CREATE MULTER-S3 FUNCTION FOR STORAGE
  storage: multerS3({
    s3: s3,
    acl: 'public-read',
    // bucket - WE CAN PASS SUB FOLDER NAME ALSO LIKE 'bucket-name/sub-folder1'
    bucket: process.env.DO_SPACES_NAME,
    // META DATA FOR PUTTING FIELD NAME
    metadata: function (req, file, cb) {

      cb(null, { fieldName: `WPD_${req.customName}` });
    },
    // SET / MODIFY ORIGINAL FILE NAME
    key: function (req, file, cb) {
      cb(null, `WPD_${req.customName}.pdf`); //set unique file name if you wise using Date.toISOString()
    }
  }),
  // SET DEFAULT FILE SIZE UPLOAD LIMIT
  limits: { fileSize: 1024 * 1024 * 100 }, // 1000MB
  // FILTER OPTIONS LIKE VALIDATING FILE EXTENSION
  fileFilter: function (req, file, cb) {
    const filetypes = /pdf/;
    const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
    const mimetype = filetypes.test(file.mimetype);
    if (mimetype && extname) {
      return cb(null, true);
    } else {
      cb("Error: Allow images only of extensions PDF !");
    }
  },
}).single('file');


// @desc      Upload PDF for Case
// @route     PUT /api/v1/cases/:id/pdf
// @access    Private
exports.casePDFUpload = asyncHandler(async (req, res, next) => {

  const casee = await Case.findById(req.params.id);


  if (!casee) {
    return next(
      new ErrorResponse(`Case not found with id of ${req.params.id}`, 404)
    );
  }

  // Create custom file name
  req.customName = casee._id;


  upload(req, res, async function (error) {
    if (error) {
      return next(
        new ErrorResponse(`Please, upload a PDF file`, 400)
      );
    }

    // Edit the Case urlPDF field
    await Case.findByIdAndUpdate(casee._id, { 'urlPDF': req.file.location });


    res.status(201).json({
      success: true,
      data: {
        "originalname": req.file.originalname,
        "fileName": req.file.key,
        "urlPDF": req.file.location,
        "mimetype": req.file.mimetype,
      },
    });
  });
});






