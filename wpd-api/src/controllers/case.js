const path = require('path');
const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Case = require('../models/case');
const User = require('../models/user');
const { sendCaseEmail } = require('../utils/send-email');

// @desc      Get all cases
// @route     GET /api/v1/cases
// @access    Private
exports.getCases = asyncHandler(async (req, res, next) => {
  res.status(200).json(res.advancedResults);
});

// @desc      Get single case
// @route     GET /api/v1/cases/:id
// @access    public
exports.getCase = asyncHandler(async (req, res, next) => {
  const casee = await Case.findById(req.params.id);

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
  const casee = await Case.create(req.body);

  res.status(201).json({
    success: true,
    data: casee,
  });
});

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

  if (!req.files) {
    return next(
      new ErrorResponse(`Please, upload a file`, 400)
    );
  }


  const file = req.files.file;

  // Make sure the file is a PDF
  if (file.mimetype !== 'application/pdf') {
    return next(
      new ErrorResponse(`Please, upload a PDF file`, 400)
    );
  }

  // Check file size
  if (file.size > process.env.MAX_FILE_UPLOAD) {
    return next(
      new ErrorResponse(`Please, upload a PDF file less than ${process.env.MAX_FILE_UPLOAD}`, 400)
    );
  }

  // Create custom file name
  file.name = `WPD_${casee._id}${path.parse(file.name).ext}`;

  file.mv(`${process.env.FILE_UPLOAD_PATH}/${file.name}`, async err => {
    if (err) {
      console.error(err);
      return next(
        new ErrorResponse(`Problem with file upload`, 500)
      );
    }

    await Case.findByIdAndUpdate(req.params.id, {
      urlPDF: file.name,
    });

    res.status(200).json({
      success: true,
      data: file.name,
    });

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



