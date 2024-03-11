const {minioClient} = require('../config')

const express = require('express')
const router = express.Router()


const Multer = require("multer");
const storage = Multer.memoryStorage();
const upload = Multer({storage: storage});

const path = require('path');


router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../templates/upload.html'));
});

router.post('/', upload.single('photo'), (req, res) => {
    if (!req.file) {
        res.status(400).send('No file uploaded');
    } else {
        minioClient.putObject("test", req.file.originalname, req.file.buffer)
            .catch((e) => {
                console.log("Error while creating object: ", e);
                throw e;
            });
        console.log("Object uploaded successfully");
    }
    res.redirect('http://localhost:8090/upload');
});



module.exports = router