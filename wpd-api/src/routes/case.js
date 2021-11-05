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
router.get('/number/:caseNumber', getCaseByCaseNumber);
router.get('/:id', getCase);
router.get('/:caseId/:userId', getCaseAndPoliceInfo);

router.use(protect);

router.get('/', advancedResults(Case, {
  path: 'category',
  select: 'title'
}
), getCases);
router.post('/', authorize('admin', 'regular'), createCase);
router.put('/:id/pdf', authorize('admin', 'regular'), casePDFUpload);
router.put('/:id', authorize('admin', 'regular'), updateCase);
router.delete('/:id', authorize('admin', 'regular'), deleteCase);
router.post('/email', sendEmail);



module.exports = router;
