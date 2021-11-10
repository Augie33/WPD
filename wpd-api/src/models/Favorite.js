const mongoose = require('mongoose');


const FavoriteSchema = new mongoose.Schema({
    _id: {
        type: mongoose.Schema.ObjectId,
        required: [true, 'Please add Owner'],
        ref: 'User',
    },
    cases: [
        {
            type: mongoose.Schema.ObjectId,
            required: [true, 'Please add a cases'],
            ref: 'Case',
        }
    ]
}, { _id: false });



module.exports = mongoose.model('Favorite', FavoriteSchema);
