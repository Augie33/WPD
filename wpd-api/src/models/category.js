const mongoose = require('mongoose');

// Fields used for each case
const CategorySchema = new mongoose.Schema({
    title: {
        type: String,
        unique: true,
        required: [true, 'Please add category title'],
    },

});

module.exports = mongoose.model('Category', CategorySchema);
