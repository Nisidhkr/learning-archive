const { default: mongoose } = require("mongoose");
const urlSchema = new mongoose.Schema(
    {
    shortId:{
        type: String,
        required: true,
        unique: true
    },
    redirectURL:{   // original url
        type: String,
        required: true,
        },
    visitHistory:[{timstamp:{type:Number}}],
    },
    {timestamps:true}
);

const URL = mongoose.model("url",urlSchema);
module.exports = URL;