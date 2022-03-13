
# Clean Weather, A Weather App

An app to list the weather for input location powered by an open API Service.

It also facilitates the user to check weather details across coming days and hour wise on particula date.

We allow user to revisit weather of cities visited earlier without internet by empowering the user jounery with local storage cache using realm.

Note: In case of active internet we will always priortise to download data from api in order maintain consistency.
 

## API Reference

#### Get all items

```http
  GET https://api.weatherapi.com/v1/forecast.json?key=5a9db04ded5d45ccabf182916221103

```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
|  |  |  |



## Authors

- [@nikhilnangia](https://www.github.com/nikhil0011)

## Tech Stack

**Client:** Swift, iOS

**Server:** REST API

 - Clean Priniciple with MVVM
 - App has been built following the principles of CLEAN architechture.
 - App has been layered into 3 different components Usecase, Presnter and main module using MVVM.
 - An internal core design system is used to style the ui components accross the app.
 - Styler is responsible for creating an multi attributed string (such as font, font size, kern, line height) and setting it accurate components.
 - Collection View added to main screen is backed up by an abstract internal data source layer which helps the implementing modules to reduce the boiler plate code and segregate the adapter code from view controller code.
 - Persistant storage is used to share core data context all over app.
 - Every entity is build with an repository pattern which provided access control for operation in form of managers to views.
 
## Running Tests

Tests for the following moduels have been added to project

- Service Class
- RealmDataManagers
**For Main Module::** 

- Data Source
- View Controller
- ViewModel
- Presenter Class

