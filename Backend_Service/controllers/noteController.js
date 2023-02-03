const Note = require('../models/noteModel');

exports.getAllNotes = async (req, res, next) => {
  const notes = await Note.find();

  res.status(200).json({
    status: 'Success',
    totalItems: notes.length,
    data: {
      notes,
    },
  });
};

exports.getByEmail = async (req, res, next) => {
  const note = await Note.find({ email: req.params.email });

  if (!note) {
    res.status(200).json({
      status: 'Success',
      message: `No note found with that email: ${req.params.email}`,
    });
  }

  res.status(200).json({
    status: 'Success',
    itemCount: note.length,
    data: {
      note,
    },
  });
};

exports.createNote = async (req, res, next) => {
  //   const note = await Note.create({
  //     email: req.body.email,
  //     title: req.body.title,
  //     content: req.body.content,
  //   });
  const note = await Note.create(req.body);
  if (!note) {
    next(
      res.status(400).json({
        status: 'Error',
      })
    );
  }

  res.status(200).json({
    status: 'Success',
    message: 'New Note Created.',
    data: {
      note,
    },
  });
};

exports.deleteOne = async (req, res, next) => {
  const note = await Note.findByIdAndDelete(req.params.id);

  if (!note) {
    return next(
      res.status(400).json({
        status: 'Error',
        message: 'No note with that id.',
      })
    );
  }

  res.status(200).json({
    status: 'Success',
    message: `Note with id: ${req.params.id} deleted successfully.`,
  });
};

exports.update = async (req, res, next) => {
  const note = await Note.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
  });

  if (!note) {
    return next(
      res.status(400).json({
        status: 'Error',
        message: 'No Note found with that id',
      })
    );
  }
  res.status(200).json({
    status: 'Success',
    message: 'Note updated successfully',
    data: {
      note,
    },
  });
};
