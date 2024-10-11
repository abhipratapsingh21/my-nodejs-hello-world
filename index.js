const http = require('http');

const server = http.createServer((request, response) => {
    response.writeHead(200, { "Content-Type": "text/plain" });
    response.end("Welcome to the RSA World!");
});

const port = 80;
server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
