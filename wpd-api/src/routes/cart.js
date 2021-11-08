const express = require('express');
const {
    getCart,
    createCart,
    deleteCart,
} = require('../controllers/cart');



const router = express.Router();


const { protect } = require('../middleware/auth');

router.get('/:id', getCart);
router.post('/', protect, createCart);
router.delete('/:id', protect, deleteCart);

module.exports = router;
