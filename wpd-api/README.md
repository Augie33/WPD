# WPD Backend

1 - Create **config** folder   </br>
2 - Create **config.env** file </br>
3 - Add these
```env
NODE_ENV=development
PORT=3000

MONGODB_URL=mongodb://127.0.0.1:27017/wpd

FILE_UPLOAD_PATH=./src/public/uploads
MAX_FILE_UPLOAD=1000000

JWT_SECRET=myappcoooooooooooooooooooool
# JWT_COOKIE_EXPIRE=30
```

4- run the app
```shell
npm run dev
```
