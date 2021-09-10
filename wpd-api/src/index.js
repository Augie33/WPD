const app = require('./app');

const port = process.env.PORT;

app.listen(port, () => {
  console.log('Server is up on port', port);
});

// Handle unhandled promise rejections
process.on('unhandledRejection', (err, promise) => {
  console.log(`Error: ${err.message}`.red);
  // Close server & exit process
  // server.close(() => process.exit(1));
});
