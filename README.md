# ios-swift-coder
just for fun
Hello bug!!!
in this course Using only uikit programatic way


# Bankey first iOS business  application 
-
First create project and save it repository 
Working with no storyboard
1. Remove files 
2. Upate info.plist 
3. Update app delegate.swift 

 -----
# Login View 
- first divide viewcontoller into view becuase it is easy to manage 
- build whole view by dividing small view 
- using extension pull out chunks of funcionality from base view 
- !!! Creating view snippet 
-  snippet is usefull. it is reuseable  

!!! adding loginview to loginviewcontroller 
        ``` loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1) ```
- above code tells us set constraints after left side of view by 8 points. (multipleier: 1) = 8 points 
- if we change multipleir : 2 value will be 16 
 
  Adding textField
- we define textField delegate using delefation pattern 
- add some function to be conformable 
- functions are based on editing

 Adding stackView
- !!! using stackView you can reach to minimize constraints That means less code
- embed in stackview all view elements we can give spacing themm equally
- remove the intrinsicContentSize property because we added stackview that takes resposibility 

 Adding the divider

- Core Animation happens in CALayer
- CALayer is under the UIView 


 Adding Sign/Log in Button 

- we add the button in the controller becuase viewController take the action with app like when button pressed behind the scene conroller gets fired. We may add LOGINVIEW However then we need delegation pattern 

 Bankey Handling Login 

- making an error label in red color 


 - Bankey Login Logic
 
 - we add password and username computed property 
 - tackle with logic
 - now learing validation textfield in uikit 
 - in validation we treat thing as hard coded , but it's gonna be change maybe in future setting up with firebase framework 


- Saving our work 
 
- ignoring files using .gitignore
 -----
# On boarding - Part 1

- Gonna be learn 
- git commands 
- agile 
- Navigation flow in UIKit

- UIpageViewContoller 
- Page view contoller is power is that contains view controller as an array and enable to user swipeable action . User can swipe the screen easily and behind scene view changed to another view. 
- in this project we have array called pages that holds 3 viewControllers
- protocol delegate pattern that we lean

![](images/5.png)

- [] adding first item of pages with car image and description of app. Actially it's view controller  
- in this lecture 31 We creare viewController and reUse it by adding two variables imageName and titleText 
- in this end of section "Close button added " Button close pages lead to the main screen

 -----
# Onboarding part 2
- learn protocol Delegate Pattern 
- we implement the loginviewcontrollerdelegate and onboardingcontroller delegate in order to notify the Appdelegate class for making naviagtion flow through views
- and also making a smoothly transation 
- using UserDefaulst to save hasOnboarded. it means onboarding screen showed only first time 
- added dummy logout view controlller for testing
 -----
# Container View Contollers 

- UINavigationViewControllers
- UITabBarViewControllers
- UIPageVieControllers 

- what are they 
- how they work 
- when and why to use them 

##### decription Container View Contollers are view contollers that contain or combine content from other view contollers into a single working interface 
- creating tab bar controller with three dummy view controllers
 -----
# Account Summary Header
- in this ection creating new branch called account-summary where we will work and at the end done wworking flawlessly then we merge this branch to main branch 
- table view added 
- create cutom header view  and add this custom view  as tablView's header view 
- also while creating header view we use nib file 

- what nib files are 
- how they work 
- they are just trush 

- header view added finally  
- fistly i tried to add header view by using xib file but it failed. ihave done everything programmatically phew, volla

 -----
# Adding table view cell section 

- in this section we creatd cell view programmatically 
- styling it with flawlessly 
- add dummy data

- what we have learnt 
- programtic cell view 
- nsAttributedstring 
- save work incrementelly 
- view models
- leverage enums 
- currency formatting 
- Status/ navbar colors 

 -----
# Unit testing 

- what are unit tests and why so valuable ?
- why write them 
- How do they work 
- How to add to existing project 

- 1. unit tests are small snippets of code we write prove our software as expected 
- 2. all  is confidence
- 3. 
- 4. by adding new target to existing project 
 -----
# Notification Center 

- The limits of protocol Delegate 
- How message Broadcasting works 
- the mechanics behind the notification center
- where and when to use this pattern

##### description: When you have a lot of views exm: four. you need to notify last view controller from first view controler here is coming Notification center pattern (observer patter) in rescue. 
 -----
# Animation with constraints 
  
- what can we do this. Simple we change the constraints. example we have label before view is loaded we changed the constraints and view is loaded we change back. animation happened
- ``` self.view.layoutIfNeeded() // Use this method to force the view to update its layout immediately. ```
-
 -----
# Animation with Core Animation  

- starting with CA everything in UIKit  that is core animation
- its power is its speed. CA can update everything view 60 times per second 
- that's why considired high level 

 -----
# Networking Section 
- adding NEtworking to project 
- Parsing json with Codable 
- URLSession 
- ResultType 
- Update UI on the main thread 
- Unit testing JSON code 
- How to leverage plaugrounds when building apps 
- functional programming (Maps)

- How Does Networking work
- we do network call in URLSession to server. Then we need to parse the json data to our codable struct that we need to create format to be fit to data which is coming from server 
- only update the ui on the main thread 
``` DispatchQueue.main.async {
   // On main thread
}
```
- note: Learning networking is best way to wotk with swift palayground

- done challenge 
  -----
  
 # Affordances

 - new feature never crossed before 
 - confusing
 - bob's your uncle we got this shit 
 - dispatch group very handy thing in swift 
 - when we have a lot of network call. that takes time by using dispatch we perform all network call once at the time not step by step.

- refresh controll 
- it's small indicator for reloading data every app has indicator. You cann see when you pull view to refresh 

- skeleton loaders
 -----
# Error Handling 
 
 - How to manually test for network errors 
 - How to fix them with pop-ups and alerts
 - How to unit test network  code 
 - How to build more robust application 

 - when network gets lost we need to provide pop-up alert to user that represents the Server Error 
  -----
# Reset Password
 
- How to do more complex layouts 
- See how UITextField interactions work 
- How to do form validations
- Unit testing controlls, functions, and viewControllers


