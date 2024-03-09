const Express = require("express");
const app = Express();
const BodyParser = require("body-parser");
const uploadForm = require('../routes/upload_form')
app.use('/upload', uploadForm);

app.use(BodyParser.json({limit: "4mb"}));


app.listen(8090, function () {
    console.log("Listening on port %s...", 8090);
});
