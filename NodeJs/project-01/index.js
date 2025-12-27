const express = require('express');
const users = require('./MOCK_DATA.json')
const app = express();
const port = 3000;

app.get('/users',(req,res)=>{
    const html = `
    <h1>Users</h1>
    <ul>
      ${users.map((use) => `<li>${use.first_name} ${use.last_name} - ${use.email}</li>`).join('')}
    </ul>`;
  res.send(html); 
  
});
//Routs
app.get('/', (req, res) => {
  res.send('Hello World!');
});


app.get('/api/users',(req,res)=>{
    return res.json(users); 
})



app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});