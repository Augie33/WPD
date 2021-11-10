const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Favorite = require('../models/Favorite');
const User = require('../models/User');
const Case = require('../models/Case');




// @desc      Favorite case
// @route     POST /api/v1/favorite/:caseId
// @access    Private
exports.favoriteCase = asyncHandler(async (req, res, next) => {
    const user = req.user;

    if (!user) {
        return next(new ErrorResponse('Invalid credentials', 401));
    }

    let favorite = await Favorite.findById(req.user._id);

    if (!favorite) {
        favorite = await Favorite.create({ _id: req.user._id });
    }



    const casee = await Case.findById(req.params.caseId);

    if (!casee) {
        return next(new ErrorResponse('Please provide correct Case ID', 404));
    }

    const update = { $addToSet: { cases: req.params.caseId } };
    const opts = { new: true };

    favorite = await Favorite.findByIdAndUpdate(req.user._id, update, opts).populate('cases');


    res.status(201).json({
        success: true,
        data: favorite,
    });
});

// @desc      Unfavorite case
// @route     DELETE /api/v1/favorite/:caseId
// @access    Private
exports.unFavoriteCase = asyncHandler(async (req, res, next) => {
    const user = req.user;

    if (!user) {
        return next(new ErrorResponse('Invalid credentials', 401));
    }

    let favorite = await Favorite.findById(req.user._id);

    if (!favorite) {
        favorite = await Favorite.create({ _id: req.user._id });
    }


    const update = { $pull: { cases: req.params.caseId } };
    const opts = { new: true };

    favorite = await Favorite.findByIdAndUpdate(req.user._id, update, opts).populate('cases');


    res.status(201).json({
        success: true,
        data: favorite,
    });
});




// @desc      Get all cases
// @route     GET /api/v1/favorite
// @access    Private
exports.getCases = asyncHandler(async (req, res, next) => {
    const user = req.user;

    if (!user) {
        return next(new ErrorResponse('Invalid credentials', 401));
    }

    let favorite = await Favorite.findById(req.user._id).populate('cases');;

    if (!favorite) {
        favorite = await Favorite.create({ _id: req.user._id }).populate('cases');;
    }


    res.status(201).json({
        success: true,
        data: favorite,
    });
});
