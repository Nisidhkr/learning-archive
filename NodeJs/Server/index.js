const http = require("http");
const fs = require("fs");
const url = require("url");
const myServer = http.createServer((req,res) => {
	//console.log(req.headers);
	 if (req.url === "/favicon.ico") {
        return res.end();
    }
	const parsedUrl = url.parse(req.url, true);
	console.log(parsedUrl);


	const log =`${Date.now()}:: ${req.url}:: ${req.method}:: New Request Recieved\n`;
	fs.appendFile("log.txt",log,(err,data) => {});

	// Routing
		
		
		switch(parsedUrl.pathname){
			case '/':
				res.end("This is the home page");
				break;

			case '/home':
				const name = parsedUrl.query.name || "Guest";
				res.end("This is the home page" + ", Welcome " + name);
				break;

			case '/search':
			const search = parsedUrl.query.q;
			if (!search) {
				res.end("Please provide a search query");
			} else {
				res.end("You searched for: " + search);
			}
			break;

			case '/about':
				res.end("This is the about page");
				break;
			case '/signup':
				if(req.method === "POST"){
					let body = '';
					req.on('data', chunk => {
						body += chunk.toString();
					});
					req.on('end', () => {
						res.end("Signup data received: " + body);
					});
				} else {
					res.end("Please send a POST request to sign up.");
				}
				break;
			case '/contact':
				res.end("This is the contact page");
				break;
			default:
				res.statusCode = 404;
				res.end("404 Page Not Found");
		}
		
	
	

});

myServer.listen(8004,() => console.log("server Started!"));
