const mongoose = require('mongoose');


const CartSchema = new mongoose.Schema({
    cases: [
        {
            type: mongoose.Schema.ObjectId,
            required: [true, 'Please add a category'],
            ref: 'Case',
        }
    ]
});



module.exports = mongoose.model('Cart', CartSchema);
