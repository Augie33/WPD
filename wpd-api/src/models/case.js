const mongoose = require('mongoose');
const AutoIncrement = require('mongoose-sequence')(mongoose);
const validator = require('validator');

const CaseSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Please add a title'],
  },
  description: {
    type: String,
    required: [true, 'Please add a description'],
  },
  url: {
    type: String,
    default: '',
  },
  urlPDF: {
    type: String,
    default: '',
  },
});

CaseSchema.plugin(AutoIncrement, { inc_field: 'caseNumber' });

module.exports = mongoose.model('Case', CaseSchema);
