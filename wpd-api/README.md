# WPD Backend

1 - Create **config** folder   </br>
2 - Create **config.env** file </br>
3 - Add these
```env
# NODE_ENV=development
PORT=3000

MONGODB_URL=<URL>

FILE_UPLOAD_PATH=./src/public/uploads
MAX_FILE_UPLOAD=1000000

JWT_SECRET=<SECRET>
# JWT_COOKIE_EXPIRE=30

SENDGRID_API_KEY=<KEY>

DO_SPACES_ENDPOINT=<ENDPOINT>
DO_SPACES_KEY=<KEY>
DO_SPACES_SECRET=<SECRET>
DO_SPACES_NAME=<SPACE>

```

4- run the app
```shell
npm run dev
```
