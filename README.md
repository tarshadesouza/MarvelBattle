# MarvelBattle

# Introduction 
Hey there thanks for taking a look at my coding test! Heres a few things to know about the way I have chosen to set up this project.

## Dependencies
Cocoapods-keys this project utilzes cocoas secure way of storing api keys: I will include here the api key (just for the sake of you being able to configure the project!)

Public Api Key(MarvelApiKey): fc42f06a05054d9751b6ecba93f353e106b7285c 

Private Api Key(MarvelPrivateKey): 41d357792b574304008264ad6fff6126

#### A little info behind my choices of Libraries
-Object Mapper: I always seem to use this library if possible, I like the way it comes with a ton of extension and its functionality.. however I am normally used to using Codable.

-Alamofire: Likewise, usually in projects Im used to using wrappers of Alamofire. And on the odd occasion URLSession. Its a well mainted Lib so Im not to worried about this decision.

-CryptoSwift: Great library for using encoding and I used this for the neccesity of the API.

-Kingfisher: Love this library for easily loading and caching images. I know we can do this natively but again, why reinvent the wheel :D

## Flow & Architecture
### Design Pattern
In all honestly I took a risk of making this project with clean architecture, I chose this mainly because I wanted to experiment more with the implications of clean. I prefer VIPER as I find it a little difficult keeping the View clear from alot of business login in Clean, however I do believe there are some rather large advantages working with Clean and testing was one of them. I also chose XIB´s instead of storyboards because I feel they are far more maintanable when your working as a team and even sometimes alone. 

### Flow
As for the flow, I chose this flow to shy away from a tab bar application. I think as a developer if you can find a way to make an app the least confusing as possible in a navBar driven application well done! Also I have found that personally I tend to choose a tab bar application because of this reason.. its easier not to think about the flow in general. In this instance the search screen serves two functions.
1. To search for characters via names.
2. To choose from a list (that you either search or have already loaded) for a battle.
I like this flow because its reusable and at the same time seperate.

### Functionalities
As suggested in the read me of the test, the user must have an option to see the list of battled characters in an offline mode. Upon entry into the application instead of a query made to fill the tableview I have made a local JSON file that contains the first couple of Characters from the API. Also In order to save the rankings between the fighters I wrote and read a local JSON file. I did not want to use Core Data for this functionality as I must admit I do not dominate and with the lack of time I chose this approach.

## Tests
### XCUnitTest
I have written a total of 10 tests which gives me a total of 47% of test coverage. All the tests were geared towards making sure that business logic is behaving as it should. This way in the future if I change an important part of my business logic I should get a failed test.

As For the UITests, Im afraid I didn´t have enough time to do any. For developing I prefer to use Unit tests and a UITest is quite similar to a QA using Appium so for me I find that unit tests are more important for a reliable code base.

Thanks Again for taking you time to look all of this over. And any feedback is welcomed!
