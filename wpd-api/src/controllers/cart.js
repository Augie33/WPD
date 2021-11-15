const asyncHandler = require('../middleware/async');
const ErrorResponse = require('../utils/error-response');
const Cart = require('../models/Cart');
const User = require('../models/User');



// @desc      Get single cart
// @route     GET /api/v1/cart/:id
// @access    Public
exports.getCart = asyncHandler(async (req, res, next) => {
    const cart = await Cart.findById(req.params.id).populate({
        path: 'cases',
        populate: { path: 'category' }
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

// @desc      Get Cart with Police info
// @route     GET /api/v1/cart/:cartId/:userId
// @access    Private
exports.getCartAndPoliceInfo = asyncHandler(async (req, res, next) => {
    const cart = await Cart.findById(req.params.cartId).populate({
        path: 'cases',
        populate: { path: 'category' }
    });

    const user = await User.findById(req.params.userId);

    if (!cart || !user) {
        return next(
            new ErrorResponse('Please provide correct Case ID & User ID', 404)
        );
    }

    user.role = undefined;
    user.__v = undefined;
    cart.__v = undefined;

    res.status(200).json({
        success: true,
        data: {
            cart,
            user
        },
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
