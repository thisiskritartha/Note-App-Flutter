const express = require('express');

const noteController = require('../controllers/noteController');

const router = express.Router();

router.get('/get-all', noteController.getAllNotes);
router.post('/create-note', noteController.createNote);
router.get('/getNote/:email', noteController.getByEmail);
router.delete('/delete/:id', noteController.deleteOne);
router.patch('/update/:id', noteController.update);

module.exports = router;
