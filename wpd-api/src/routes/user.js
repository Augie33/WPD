const express = require('express');
const advancedResults = require('advanced-results');
const {
  getUsers,
  getUser,
  createUser,
  updateUser,
  deleteUser,
} = require('../controllers/users');

const User = require('../models/user');

const router = express.Router();

const { protect, authorize } = require('../middleware/auth');

router.use(protect);

router.get('/', authorize('admin', 'police'),advancedResults(User), getUsers);
router.post('/', authorize('admin'), createUser);

router.get('/:id', authorize('admin', 'police'), getUser);
router.put('/:id', authorize('admin'), updateUser);
router.delete('/:id', authorize('admin'), deleteUser);

module.exports = router;
