const express = require('express')
const router = express.Router()

const {minioClient} = require('../config')
router.get('/:bucketName/:imageName', async (req, res) => {
    const bucketName = req.params.bucketName;
    const imageName = req.params.imageName;
    const expiration = 60 * 5

    try {
        let presignedUrl = await minioClient.presignedGetObject(bucketName, imageName, expiration);
        presignedUrl = presignedUrl.replace('minio', 'localhost');
        let index = presignedUrl.indexOf("?");
        presignedUrl = presignedUrl.substring(0, index);

        res.send(`<img src="${presignedUrl}"  alt="pic"/>`);
    } catch (err) {
        console.error('Error generating presigned URL:', err)
        res.status(500).send('Error generating presigned URL')
    }
});

module.exports = router