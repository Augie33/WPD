const path = require('path');
const express = require('express');
const colors = require('colors');
const morgan = require('morgan');
const mongoose = require('mongoose');
const cookieParser = require('cookie-parser');
const connectDB = require('./db/mongoose');
const errorHandler = require('./middleware/error');
const cors = require('cors')

// Connect to database
connectDB();

// mongoose.set('debug', true);

// Route files
const auth = require('./routes/auth');
const users = require('./routes/user');
const cases = require('./routes/case');
const category = require('./routes/category');

const app = express();

// Body parser
app.use(express.json());

// Cookie parser
app.use(cookieParser());

// enable CORS
app.use(cors());

// Dev logging middleware
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

// // File uploading
// app.use(fileupload());

// Set static folder
// app.use(express.static(path.join(__dirname, 'public')));

// Mount routers
app.use('/api/v1/auth', auth);
app.use('/api/v1/users', users);
app.use('/api/v1/cases', cases);
app.use('/api/v1/category', category);

app.use(errorHandler);

module.exports = app;
