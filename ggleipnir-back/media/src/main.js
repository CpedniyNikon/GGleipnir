const Express = require("express");
const Multer = require("multer");
const Minio = require("minio");
const BodyParser = require("body-parser");
const app = Express();

const storage = Multer.memoryStorage();
const upload = Multer({storage: storage});

app.use(BodyParser.json({limit: "4mb"}));

const minioClient = new Minio.Client({
    endPoint: "minio",
    port: 9000,
    useSSL: false,
    accessKey: 'admin',
    secretKey: 'Secure123$'
});


app.get('/', (req, res) => {
    res.send(`
    <form action="/upload" method="post" enctype="multipart/form-data">
      <input type="file" name="photo">
      <input type="submit" value="Upload">
    </form>
  `);
});

app.post('/upload', upload.single('photo'), (req, res) => {
    if (!req.file) {
        res.status(400).send('No file uploaded');
    } else {
         minioClient
            .putObject("test", req.file.originalname, req.file.buffer)
            .catch((e) => {
                console.log("Error while creating object: ", e);
                throw e;
            });
        console.log("Object uploaded successfully");
    }
    res.redirect('http://localhost:8090/');
});


app.listen(8090, function () {
    console.log("Listening on port %s...", 8090);
});
