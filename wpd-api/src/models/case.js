const mongoose = require('mongoose');
const AutoIncrement = require('mongoose-sequence')(mongoose);
const validator = require('validator');

// Fields used for each case
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
  category: {
    type: mongoose.Schema.ObjectId,
    ref: 'Category',
    required: [true, 'Please choose a category'],
  }

});

// Auto-increment case number 
CaseSchema.plugin(AutoIncrement, { inc_field: 'caseNumber' });

module.exports = mongoose.model('Case', CaseSchema);
