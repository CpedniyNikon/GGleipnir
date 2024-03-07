'use strict';

const express = require('express');

const port = 8090;
const host = '0.0.0.0';

const app = express();
app.get('/', (req, res) => {
    res.send('Hello World');
});

app.listen(port, host, () => {
    console.log(`Running on http://${host}:${port}`);
});