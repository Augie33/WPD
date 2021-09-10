const mongoose = require('mongoose');

const connectDB = async () => {
  const conn = await mongoose.connect(process.env.MONGODB_URL, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: false,
    useUnifiedTopology: true,
  });

  console.log(`MongoDB Connected: ${conn.connection.host}`.cyan.underline.bold);
};

mongoose.connection.on('connected', function () {
  console.log('Mongoose default connection open to ' + process.env.MONGODB_URL);
});

mongoose.connection.on('error', function (err) {
  console.log('Mongoose default connection error');
});

mongoose.connection.on('disconnected', function () {
  console.log('Mongoose default connection disconnected');
});

module.exports = connectDB;
