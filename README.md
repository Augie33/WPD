# WPD

<img src="https://user-images.githubusercontent.com/24327781/134834641-a10c2096-a727-4eda-8da6-e89b12cb5c26.png" width="250" /><img src="https://user-images.githubusercontent.com/24327781/134834647-ce9cd8a0-4a94-4a7c-827c-a351c8478d96.png" width="250" />

## Folders
  - **wpd-api**: the backend side
  - **wpd_app**: the Mobile App
  - **wpd-webview**: information page
  - **design**: all Adobe XD files and assets
  - **journals**
        - Abdulrahman
        - Andrew
        - Dhari
        - Elina
  - **weekly_minutes**


## Software Architectural Pattern
  - Mobile APP -> MVVM (Model–view–viewmodel)
  - Backend -> MVC (Model–view–controller)


## Project Structure

<img src="https://user-images.githubusercontent.com/24327781/119294381-f248e580-bc19-11eb-80f8-4d3f2107c12b.png" width="600" />


## Usage

### WPD Backend

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
### Mobile Application

1 - Open the **wpd_app** folder
2- run
```shell
flutter pub get
```
3- run
```shell
flutter run
```


