const express = require('express');
//const users = require('./MOCK_DATA.json');
const User = require('./models/users');
const userRouter = require('./routes/user');
const fs = require('fs');
const {connectMongodb} = require('./connection');
const app = express();
const port = 3000;


//connection to mongodb
connectMongodb('mongodb://127.0.0.1:27017/users')

// schema and model moved to models/users.js


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

app.use ('/users', userRouter); // iska mtlb hai maine apne exprees ko bola ki agar /user pe koi request aayi to use userRouter pe bhej do jo ki humne upar import kiya hai 




app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});