const path = require('path');
const express = require('express');
const colors = require('colors');
const morgan = require('morgan');
const mongoose = require('mongoose');
const cookieParser = require('cookie-parser');
const connectDB = require('./db/mongoose');
const errorHandler = require('./middleware/error');
const cors = require('cors')
const mongoSanitize = require('express-mongo-sanitize');
const helmet = require("helmet");
const xss = require('xss-clean');
const rateLimit = require('express-rate-limit');
const hpp = require('hpp');

// Connect to database
connectDB();

// mongoose.set('debug', true);

// Route files
const auth = require('./routes/auth');
const users = require('./routes/user');
const cases = require('./routes/case');
const category = require('./routes/category');
const cart = require('./routes/cart');
const favorite = require('./routes/favorite');

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

// Sanitize data
app.use(mongoSanitize());

// Set security headers
app.use(helmet());

// Prevent XSS attacks
app.use(xss());

// Rate limiting
const limiter = rateLimit({
  windowMs: 10 * 60 * 1000, // 10 mins
  max: 1000,
});

app.use(limiter);

// Prevent http param pollution
app.use(hpp());

// Set static folder
// app.use(express.static(path.join(__dirname, 'public')));

// Mount routers
app.use('/api/v1/auth', auth);
app.use('/api/v1/users', users);
app.use('/api/v1/cases', cases);
app.use('/api/v1/category', category);
app.use('/api/v1/cart', cart);
app.use('/api/v1/favorite', favorite);

app.use(errorHandler);

module.exports = app;
