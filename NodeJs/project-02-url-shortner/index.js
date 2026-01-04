const express = require('express');
const port = 5000;
const app = express();

app.get('/',(req,res)=>{
    res.send("hello how are you")
})

app.listen(port,()=>console.log(`server starte on http://localhost:${port}`))