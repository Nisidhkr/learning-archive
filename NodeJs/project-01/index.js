const express = require('express');
const users = require('./MOCK_DATA.json');
const fs = require('fs');
const mongoose = require('mongoose');
const app = express();
const port = 3000;
//connection to mongodb
mongoose.connect('mongodb://127.0.0.1:27017/users')
.then(()=>console.log('Connected to MongoDB'))
.catch((err)=>console.log('Error connecting to MongoDB:', err));

// schema
const userSchema= new mongoose.Schema({
  firstName:{
    type: String,
    required: true
  },
  lastName:{
    type: String,
    required: true
  },
  email:{
    type: String,
    required: true,
    unique: true
  },
  gender:{
    type: String,
    required: true
  },
  jobTitle:{
    type: String,
    required: true
  }

},{timestamps: true});
//creating model for mongodb
const User = mongoose.model('User', userSchema);

// Middleware to parse JSON bodies
app.use(express.json());
// Middleware to parse URL-encoded bodies
//app.use(express.urlencoded({ extended: false }));
app.use((req,res,next)=>{
    //return res.json({message:'hello from middleware 1'});
    //console.log('middleware 1 executed');
    next();
})


//Routs


//to get users from JSON file and display in HTML format
// app.get('/users',(req,res)=>{
//     const html = `
//     <h1>Users</h1>
//     <ul>
//       ${users.map((user) => `<li>${user.first_name} ${user.last_name} - ${user.email}</li>`).join('')}
  
//     </ul>`;
//   res.send(html); 
  
// }); 

app.get('/users',async(req,res)=>{
  const allDbUsers = await User.find({});
    const html = `
    <h1>Users</h1>
    <ul>
      ${allDbUsers.map((user) => `<li>${user.firstName} ${user.lastName} - ${user.email}</li>`).join('')}
  
    </ul>`;
  res.send(html); 
  
});

// Rest API route to get users in JSON format
app.get('/', (req, res) => {
  
  res.setHeader('Content-Type', 'application/json');
  res.setHeader('name','nisidh kumar');
  
  console.log(req.headers);
  const nameHeader = req.headers['name'];
  console.log('Name Header:', nameHeader);
  res.send('Hello World!');
});


app.get('/api/users',(req,res)=>{
    return res.json(users); 
});

// app.get('/api/users/:id',(req,res)=>{   // done in route method
//     const userId = parseInt(req.params.id);
//     const user = users.find(user => user.id === userId);
//     if(user){
//         return res.json(user);
//     }else{
//         return res.status(404).json({message: 'User not found'});
//     }
// })
app.post('/api/users',async (req,res)=>{
    const body = req.body;
    if(
      !body.first_name ||
      !body.last_name  ||
      !body.email      ||
      !body.gender     ||
      !body.job_title
        ){
          return res.status(400).json({error: 'Missing required fields'});
    }
    // users.push({...body, id:users.length +1});
    // fs.writeFile("./MOCK_DATA.json", JSON.stringify(users), (err,data) => {
    //   return res.status(201).json({status:'user added',id: users.length});
    // });
    const result = await User.create({
      firstName: body.first_name,
      lastName: body.last_name,
      email: body.email,
      gender: body.gender,
      jobTitle: body.job_title  
    });
    console.log(result);
    return res.status(201).json({status:'user added',id: result._id});

});
// app.patch('/api/users/:id',(req, res)=>{  done in route method
//     return res.json({status:'pending'});
// });
// app.delete('/api/users/:id',(req,res)=>{
//     return res.json({status:'pending'});
// })



// we can create a single route to handle all methods too
app.route('/api/users/:id')
.get((req,res)=>{
    const userId = parseInt(req.params.id);
    const user = users.find(user => user.id === userId);
    if(!user){
        return res.status(404).json({message: 'User not found'});
    }
    if(user){
        return res.json(user);
    }else{
        return res.status(404).json({message: 'User not found'});
    }
})
.patch((req, res)=>{
    const body = req.body;
    const userId = parseInt(req.params.id);
    const user = users.find(user => user.id === userId);
    if(user){
        // user.first_name = body.first_name;
        // user.last_name = body.last_name;
        // user.email = body.email;
        user.job_title = body.job_title;
        fs.writeFile("./MOCK_DATA.json", JSON.stringify(users), (err,data) => {
          return res.json({status:'user updated'});
        });
    }
    else{
        return res.status(404).json({message: 'User not found'});
    }
})
.delete((req,res)=>{
  const userId = parseInt(req.params.id);
  const user = users.find(user => user.id === userId);
  if(user){
      const index = users.indexOf(user);
      users.splice(index, 1);
      fs.writeFile("./MOCK_DATA.json", JSON.stringify(users), (err,data) => {
        return res.json({status:'user deleted', id:userId});
      });
  }
})




app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});