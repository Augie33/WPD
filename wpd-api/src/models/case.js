//Using Node.js require()
const mongoose = require('mongoose');
const AutoIncrement = require('mongoose-sequence')(mongoose);
const validator = require('validator');

//Fields needed for each case
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

//Auto-increments the case number to keep track of the cases and make sure there are no duplicates
CaseSchema.plugin(AutoIncrement, { inc_field: 'caseNumber' });

module.exports = mongoose.model('Case', CaseSchema);
