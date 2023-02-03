const express = require('express');

const noteController = require('../controllers/noteController');

const router = express.Router();

router.get('/get-all', noteController.getAllNotes);
router.post('/create-note', noteController.createNote);
router.get('/getNote/:email', noteController.getByEmail);

module.exports = router;
