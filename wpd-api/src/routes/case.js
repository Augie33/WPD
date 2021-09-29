const express = require('express');
const advancedResults = require('advanced-results');
const {getCases, getCase, getCaseByCaseNumber,createCase, updateCase, deleteCase,} = require('../controllers/case')

const Case = require('../models/case');




const router = express.Router();

const { protect, authorize } = require('../middleware/auth');

router.use(protect);


router.get('/', authorize('police'),advancedResults(Case), getCases);
router.post('/', authorize('police'), createCase);
router.get('/:id', authorize( 'police'), getCase);
router.get('/number/:caseNumber', authorize( 'police'), getCaseByCaseNumber);
router.put('/:id', authorize('police'), updateCase);
router.delete('/:id', authorize('police'), deleteCase);


module.exports = router;