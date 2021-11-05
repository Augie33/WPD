const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Category = require('../models/category');



// @desc      Get all categories
// @route     GET /api/v1/category
// @access    Private/Admin
exports.getCategories = asyncHandler(async (req, res, next) => {
    res.status(200).json(res.advancedResults);
});

// @desc      Get single category
// @route     GET /api/v1/category/:id
// @access    Private
exports.getCategory = asyncHandler(async (req, res, next) => {
    const category = await Category.findById(req.params.id);

    if (!category) {
        return next(
            new ErrorResponse(`No category with the id of ${req.params.id}`, 404)
        );
    }

    res.status(200).json({
        success: true,
        data: category,
    });
});

// @desc      Create category
// @route     POST /api/v1/category
// @access    Private/Admin
exports.createCategory = asyncHandler(async (req, res, next) => {
    const category = await Category.create(req.body);


    res.status(201).json({
        success: true,
        data: category,
    });
});

// @desc      Update category
// @route     PUT /api/v1/category/:id
// @access    Private/Admin
exports.updateCategory = asyncHandler(async (req, res, next) => {
    const category = await Category.findByIdAndUpdate(req.params.id, req.body, {
        new: true,
        runValidators: true,
    });

    if (!category) {
        return next(
            new ErrorResponse('Please provide correct Category ID', 404)
        );
    }

    res.status(200).json({
        success: true,
        data: category,
    });
});

// @desc      Delete category
// @route     DELETE /api/v1/category/:id
// @access    Private/Admin
exports.deleteCategory = asyncHandler(async (req, res, next) => {
    await Category.findByIdAndDelete(req.params.id);

    res.status(200).json({
        success: true,
        data: {},
    });
});
