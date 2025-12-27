const express = require('express');
const app = express();
const port = 3000;
app.get('/',(req,res)=>{
    return res.send('Hello World from Express.js server!');
});
app.get('/about',(req,res)=>{
    return res.send(`hello ${req.query.name}, This is the about page.`);
});
app.post('/', (req, res) => {
  res.send('Got a POST request')
});
app.put('/user', (req, res) => {
  res.send('Got a PUT request at /user')
});
// app.delete('/user', (req, res) => {
//   res.send('Got a DELETE request at /user')
// });

app.listen(port,()=>{
    console.log(`Server is running on http://localhost:${port}`);
});