const { google } = require("googleapis")

const drive = google.drive("v3")

const key = require("./private_key.json")

const path = require("path")

const fs = require("fs")

const jwToken = new google.auth.JWT(
    key.client_email,
    null,
    key.private_key,
    ["https://www.googleapis.com/auth/drive"],
    null
)
jwToken.authorize((authError) => {
    if(authError){
        console.log("error :" + authError)
        return;
    }
    else{
        console.log("Authorization accorded")
    }
})

// list file in speciifcs folder
// var parents = "1OpTkzty6FnZV-2Q5oUfJP1S9w-vfFavN"
// drive.files.list({

//   auth: jwToken,
//   pageSize: 10,
//   q: "'" + parents + "' in parents and trashed=false",
//   fields: 'files(id, name)',
// }, (err, {
//   data
// }) => {
//   if (err) return console.log('The API returned an error: ' + err);
//   const files = data.files;
//   if (files.length) {
//     console.log('Files:');
//     files.map((file) => {
//       console.log(`${file.name} (${file.id})`);
//     });
//   } else {
//     console.log('No files found.');
//   }
// });

// upload file in specific folder
var folderId = "1OpTkzty6FnZV-2Q5oUfJP1S9w-vfFavN";
var fileMetadata = {
  'name': 'upload3.txt',
  parents: [folderId]
};
var media = {
  mimeType: 'text/plain',
  body: fs.createReadStream(path.join(__dirname, './apps/file/text.txt'))
};
drive.files.create({
  auth: jwToken,
  resource: fileMetadata,
  media: media,
  fields: 'id'
}, function(err, file) {
  if (err) {
    // Handle error
    console.error(err);
  } else {
    console.log('File Id: ', file.data.id);
  }
});