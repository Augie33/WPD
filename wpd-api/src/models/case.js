const mongoose = require('mongoose');
const AutoIncrement = require('mongoose-sequence')(mongoose);


const CaseSchema = new mongoose.Schema({
    title: {
        type: String,
        required: [true, 'Please add a title'],
    }
  });

CaseSchema.plugin(AutoIncrement, {inc_field: 'caseNumber'});

module.exports = mongoose.model('Case', CaseSchema);
