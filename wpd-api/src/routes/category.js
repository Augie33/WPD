const express = require('express');
const advancedResults = require('advanced-results');
const {
    getCategories,
    getCategory,
    createCategory,
    updateCategory,
    deleteCategory,
} = require('../controllers/category');

const Category = require('../models/category');
const router = express.Router();


const { protect, authorize } = require('../middleware/auth');

router.use(protect);

router.get('/', advancedResults(Category), getCategories);
router.get('/:id', getCategory);
router.post('/', authorize('admin'), createCategory);
router.put('/:id', authorize('admin'), updateCategory);
router.delete('/:id', authorize('admin'), deleteCategory);

module.exports = router;
