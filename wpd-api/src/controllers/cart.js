const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Cart = require('../models/cart');



// @desc      Get single cart
// @route     GET /api/v1/cart/:id
// @access    Public
exports.getCart = asyncHandler(async (req, res, next) => {
    const cart = await Cart.findById(req.params.id).populate({
        path: 'cases',
        select: 'title',
    });

    if (!cart) {
        return next(
            new ErrorResponse(`No Cart with the id of ${req.params.id}`, 404)
        );
    }



    res.status(200).json({
        success: true,
        data: cart,
    });
});

// @desc      Create cart
// @route     POST /api/v1/cart
// @access    Private
exports.createCart = asyncHandler(async (req, res, next) => {
    const cart = await Cart.create(req.body);


    res.status(201).json({
        success: true,
        data: cart,
    });
});



// @desc      Delete cart
// @route     DELETE /api/v1/cart/:id
// @access    Private
exports.deleteCart = asyncHandler(async (req, res, next) => {
    await Cart.findByIdAndDelete(req.params.id);

    res.status(200).json({
        success: true,
        data: {},
    });
});