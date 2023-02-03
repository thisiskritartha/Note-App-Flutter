const dotenv = require('dotenv');
const express = require('express');
const mongoose = require('mongoose');

const router = require('./Routes/noteRouter');

const app = express();
dotenv.config({
  path: './config.env',
});

const db = process.env.DATABASE.replace('<password>', process.env.DATABASE_PASSWORD);

mongoose.set('strictQuery', true);
mongoose
  .connect(db, {
    useNewUrlParser: true,
  })
  .then(() => {
    console.log('DB connected successfully...');
  });

app.use(express.json());

app.use('/', router);

const port = process.env.PORT || 8000;

app.listen(port, () => {
  console.log(`Listening to Port ${port}...`);
});
