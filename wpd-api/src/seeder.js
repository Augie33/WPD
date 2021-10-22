const fs = require('fs');
const mongoose = require('mongoose');
const colors = require('colors');
const dotenv = require('dotenv');

console.log(__dirname);

// Load env vars
dotenv.config({ path: './config/config.env' });

// Load models
const Category = require('./models/category')
const Case = require('./models/case');
const User = require('./models/User');

// Connect to DB
mongoose.connect(process.env.MONGODB_URL, {
  useNewUrlParser: true,
  useCreateIndex: true,
  useFindAndModify: false,
  useUnifiedTopology: true,
});

// Read JSON files for cases and users
const categories = JSON.parse(
  fs.readFileSync(`${__dirname}/_data/category.json`, 'utf-8')
);

const cases = JSON.parse(
  fs.readFileSync(`${__dirname}/_data/cases.json`, 'utf-8')
);

const users = JSON.parse(
  fs.readFileSync(`${__dirname}/_data/users.json`, 'utf-8')
);

// Import into DB
const importData = async () => {
  try {
    await Category.create(categories);
    await Case.create(cases);
    await User.create(users);
    console.log('Data Imported...'.green.inverse);
    process.exit();
  } catch (err) {
    console.error(err);
  }
};

// Delete data
const deleteData = async () => {
  try {
    await Category.deleteMany();
    await Case.deleteMany();
    await User.deleteMany();

    console.log('Data Destroyed...'.red.inverse);
    process.exit();
  } catch (err) {
    console.error(err);
  }
};

//'-i' import and '-d' delete
if (process.argv[2] === '-i') {
  importData();
} else if (process.argv[2] === '-d') {
  deleteData();
}
