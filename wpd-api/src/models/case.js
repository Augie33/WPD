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
    validate(value) {
      if (!validator.isURL(value)) {
        throw new Error('Please correct url');
      }
    },
    required: [true, 'Please add a url'],
  },
  urlPDF: {
    type: String,
    validate(value) {
      if (!validator.isURL(value)) {
        throw new Error('Please correct urlPDF');
      }
    },
    required: [true, 'Please add a pdf'],
  },
});

CaseSchema.plugin(AutoIncrement, { inc_field: 'caseNumber' });

module.exports = mongoose.model('Case', CaseSchema);
