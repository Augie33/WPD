const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Case = require('../models/case');
const User = require('../models/user');



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

    if(!casee){
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
    const casee = await Case.findOne({caseNumber: req.params.caseNumber});

    if(!casee){
        return next(new ErrorResponse('Please provide correct Case ID', 404));
    }
  
    res.status(200).json({
      success: true,
      data: casee,
    });
  });
  

  // @desc      Get Case with Police info
  // @route     GET /api/v1/cases/:caseNumber/:userId
  // @access    Private
  exports.getCaseAndPoliceInfo = asyncHandler(async (req, res, next) => {
    const casee = await Case.findById(req.params.caseNumber);


    const user = await User.findById(req.params.userId);

    if(!casee || !user){
        return next(new ErrorResponse('Please provide correct Case ID & User ID', 404));
    }



  
    res.status(200).json({
      success: true,
      data: {
        ...casee,
        ...user
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



// @desc      Update case
// @route     PUT /api/v1/cases/:id
// @access    Private
exports.updateCase = asyncHandler(async (req, res, next) => {

    const casee = await Case.findByIdAndUpdate(req.params.id, req.body, {
        new: true,
        runValidators: true,
      })
  
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
  