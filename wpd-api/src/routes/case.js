const express = require('express');
const advancedResults = require('advanced-results');
const {
  getCases,
  getCase,
  getCaseByCaseNumber,
  getCaseAndPoliceInfo,
  createCase,
  casePDFUpload,
  updateCase,
  deleteCase,
  sendEmail,
} = require('../controllers/case');

const Case = require('../models/case');


const router = express.Router({ mergeParams: true });

const { protect, authorize } = require('../middleware/auth');

router.get('/:id', getCase);
router.get('/:caseId/:userId', getCaseAndPoliceInfo);

router.use(protect);

router.get('/', advancedResults(Case, {
  path: 'category',
  select: 'title'
}
), getCases);
router.post('/', createCase);
router.put('/:id/pdf', casePDFUpload);
router.get('/number/:caseNumber', getCaseByCaseNumber);
router.put('/:id', updateCase);
router.delete('/:id', deleteCase);
router.post('/email', sendEmail);

module.exports = router;
