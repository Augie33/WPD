const mongoose = require('mongoose');

// Fields used for each Category
const CategorySchema = new mongoose.Schema({
    title: {
        type: String,
        unique: true,
        required: [true, 'Please add category title'],
    },

});


// Reverse populate with virtuals
CategorySchema.virtual('cases', {
    ref: 'Case',
    localField: '_id',
    foreignField: 'category',
    justOne: false
});

module.exports = mongoose.model('Category', CategorySchema);
