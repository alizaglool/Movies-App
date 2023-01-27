
# Movies App Task
Movies List             |  Movie Details
:-------------------------:|:-------------------------:
![Home Screen](https://user-images.githubusercontent.com/50532840/215114609-0648941f-a1ed-414f-9cdc-a3dc68d7d243.png)  |  ![Details Screen](https://user-images.githubusercontent.com/50532840/215114979-8e9e5d92-cdd1-4de4-ab9a-efdd8a5d7149.png)
![ex deep link](https://user-images.githubusercontent.com/50532840/215125060-d1507a64-500d-4e37-8906-c5745bf1af5b.png)  |  ![openApp By deepLink](https://user-images.githubusercontent.com/50532840/215125130-22ac4814-b8fb-4fb3-8b2f-acb1606dfe78.png)

## Appliction Description
* The app does some of these tasks like request api to Network Layer and response Data and show the Data
* The app can be Display 3 information (Image Movie, Name Movie, and Description Movie)
* The app can be Movie Details when selelted any item for cell
* The app can Open by Deep Link and Open Details specific Movie by Movie ID
* The app can Receive Notifications from Firebase Cloud

## Base MVP Design Architectureb Project for Swift and Firebase

* using in the task MVP becouse in MVP the ViewController and Presenter are Independent of one anather and interact via InterFase.
* using in the task Firebase becouse Push Notifications by Firebase Cloud Messaging


## Examples for deep links
```
let deepLinkApp = "movieapp://"
let moviesListLink = "movieapp://home"
let movieDetailsLink = "movieapp://movieId/315162"
let listOfMovieID = [536554, 315162, 76600, 846433, 653851, 899112, 736526, 436270]

```

## Steps for use it 
1. First open this Go to: Finder → Applications → Xcode → step Firebase Package → run project   
2. Now Congratulations!!! you can use this project 

## License
>This Helper software licensed under the Zaghloul.
