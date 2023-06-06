const multer = require('multer');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, process.env.FILE_PATH);
    },
    filename: function(req, file, cb) {
        cb(null, file.originalname);
    }
})

exports.storage = storage;

const upload = multer({storage: storage});

exports.upload = upload;

exports.uploadSingle = upload.single('image');