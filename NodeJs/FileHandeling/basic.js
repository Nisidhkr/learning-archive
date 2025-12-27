const fs = require('fs');
fs.writeFileSync("./temp.js","console.log('This is a temporary file');");
const temp = fs.readFileSync("./temp.js","utf-8");
console.log(temp);
fs.