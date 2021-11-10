const express = require('express');
const {
    favoriteCase,
    unFavoriteCase,
    getCases,
} = require('../controllers/favorite');



const router = express.Router();


const { protect } = require('../middleware/auth');


router.post('/:caseId', protect, favoriteCase);
router.delete('/:caseId', protect, unFavoriteCase);
router.get('/', protect, getCases);

module.exports = router;
