const express = require('express');
const advancedResults = require('advanced-results');
const {
  getCases,
  getCase,
  getCaseByCaseNumber,
  getCaseAndPoliceInfo,
  createCase,
  updateCase,
  deleteCase,
} = require('../controllers/case');

const Case = require('../models/case');

const router = express.Router();

const { protect, authorize } = require('../middleware/auth');

router.get('/:id', getCase);
router.get('/:caseId/:userId',getCaseAndPoliceInfo);

router.use(protect);

router.get('/', advancedResults(Case), getCases);
router.post('/', createCase);
router.get('/number/:caseNumber', getCaseByCaseNumber);
router.put('/:id', updateCase);
router.delete('/:id', deleteCase);

module.exports = router;
