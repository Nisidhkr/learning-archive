const express = require('express')
const router = express.Router();

//to get users from JSON file and display in HTML format
// app.get('/users',(req,res)=>{
//     const html = `
//     <h1>Users</h1>
//     <ul>
//       ${users.map((user) => `<li>${user.first_name} ${user.last_name} - ${user.email}</li>`).join('')}
  
//     </ul>`;
//   res.send(html); 
  
// }); 

// router.get('/',async(req,res)=>{
//   const allDbUsers = await User.find({});
//     const html = `
//     <h1>Users</h1>
//     <ul>
//       ${allDbUsers.map((user) => `<li>${user.firstName} ${user.lastName} - ${user.email}</li>`).join('')}
  
//     </ul>`;
//   res.send(html); 
  
// });

// Rest API route to get users in JSON format
// router.get('/', (req, res) => {
  
//   res.setHeader('Content-Type', 'application/json');
//   res.setHeader('name','nisidh kumar');
  
//   console.log(req.headers);
//   const nameHeader = req.headers['name'];
//   console.log('Name Header:', nameHeader);
//   res.send('Hello World!');
// });


router.get('/api/users',(req,res)=>{
    return res.json(users); 
});

// router.get('/api/users/:id',(req,res)=>{   // done in route method
//     const userId = parseInt(req.params.id);
//     const user = users.find(user => user.id === userId);
//     if(user){
//         return res.json(user);
//     }else{
//         return res.status(404).json({message: 'User not found'});
//     }
// })
router.post('/',async (req,res)=>{
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
router.route('/:id')
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

module.exports = router;