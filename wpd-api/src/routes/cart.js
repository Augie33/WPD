const express = require('express');
const {
    getCart,
    getCartAndPoliceInfo,
    createCart,
    deleteCart,
} = require('../controllers/cart');



const router = express.Router();


const { protect } = require('../middleware/auth');

router.get('/:id', getCart);
router.get('/:cartId/:userId', getCartAndPoliceInfo);
router.post('/', protect, createCart);
router.delete('/:id', protect, deleteCart);

module.exports = router;
