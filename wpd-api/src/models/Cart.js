const mongoose = require('mongoose');


const CartSchema = new mongoose.Schema({
    caseNumber: {
        type: String,
        trim: true,
        unique: true,
        required: [true, 'Please add a case number'],
    },
    cases: [
        {
            type: mongoose.Schema.ObjectId,
            ref: 'Case',
        }
    ]
});



module.exports = mongoose.model('Cart', CartSchema);
