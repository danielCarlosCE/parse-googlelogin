# parse-googlelogin
An iOS project to serve as an example how to use google login in a parse application.

This project calls a ParseCloud function, sending an accessToken from Google/SignIn framework. The ParseCloud function returns a sessionToken, which is used in the `PFUser.becomeInBackground(sessionToken: String)` method. Therefore, you can get the accessToken for other clients (i.e Android) using the respective Google/Signin library and using the respective `become` method.

Required steps:

1. Once you have downloaded the project, use the `pod install` command.  
(Remember to use ParseGoogleAuth.xcworkspace instead of ParseGoogleAuth.xcodeproj).  
For more information about CocoaPods, visit: [https://cocoapods.org/](https://cocoapods.org/)

2. Change the Bundle ID

3. Go to [Google console](https://console.developers.google.com/project) to create a Google project.

4. Go to [credentials](https://console.developers.google.com/apis/credentials/) and in the "OAuth consent screen" tab, set the "Product name shown to users" to your project's name and save.   
In the "Credentials" tab, select "New credentials">"OAuth client ID">"iOS", set your project's Bundle ID and save.

5. Go to this [link](https://developers.google.com/mobile/add?platform=ios&cntapi=signin&cnturl=https:%2F%2Fdevelopers.google.com%2Fidentity%2Fsign-in%2Fios%2Fsign-in%3Fconfigured%3Dtrue&cntlbl=Continue%20Adding%20Sign-In) and follow the steps. It will generate a GoogleService-Info.plist file. Replace the GoogleService-Info.plist in the project with this one.

6. On Xcode, click in your project and in the "Info" tab, there's URL Types section. There are two items, one is the REVERSED_CLIENT_ID you can find in the GoogleService-Info.plist file and the second one is your project's Bundle ID (lowercase).

5. Go to the AppDelegate.swift and replace this line ` Parse.setApplicationId("abc",clientKey: "abc")` with the right information of your Parse application.

6. You can find [here](https://github.com/danielCarlosCE/parsecloud-googlelogin/blob/master/cloud/main.js) the main.js file you need in your ParseCloud project. (Change the `clientsIds` value).  
For more information about ParseCloud, visit [https://parse.com/docs/cloudcode/guide](https://parse.com/docs/cloudcode/guide)
