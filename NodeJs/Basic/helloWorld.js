
const os = require('os');  // Importing the os module
const arithematicFunctions = require('./arithematicFunctions');  // Importing the module
console.log("hello how are you")
console.log("Addition of 5 and 3 is: " + arithematicFunctions.addition(5, 3));
console.log("Subtraction of 5 and 3 is: " + arithematicFunctions.subtraction(5, 3));
console.log("Multiplication of 5 and 3 is: " + arithematicFunctions.multiplication(5, 3));      
console.log("Division of 6 and 3 is: " + arithematicFunctions.division(6, 3));
console.log("Modulus of 5 and 3 is: " + arithematicFunctions.modulus(5, 3));
console.log("\n");

console.log(`System Information:
-------------------
OS Type: ${os.type()}
OS Platform: ${os.platform()}
OS Release: ${os.release()}
Total Memory: ${(os.totalmem() / (1024 ** 3)).toFixed(2)} GB
Free Memory: ${(os.freemem() / (1024 ** 3)).toFixed(2)} GB
CPU Architecture: ${os.arch()}
Number of CPU Cores: ${os.cpus().length}
Uptime: ${(os.uptime() / 3600).toFixed(2)} hours
`);
console.log(os.cpus().length);