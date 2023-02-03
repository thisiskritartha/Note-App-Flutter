const mongoose = require('mongoose');

const noteSchema = new mongoose.Schema({
  id: {
    type: String,
    required: [true, 'Note must contain ID'],
    unique: true,
  },
  email: {
    type: String,
    required: [true, 'Note must contain email'],
  },
  title: {
    type: String,
    required: [true, 'Note must contain Title'],
    unique: true,
    trim: true,
  },
  content: {
    type: String,
    required: [true, 'Note must contain Content'],
  },
  dateAdded: {
    type: Date,
    default: Date.now(),
  },
});

const Note = new mongoose.model('Note', noteSchema);

module.exports = Note;
