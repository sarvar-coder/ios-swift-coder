# ios-swift-coder
just for fun
Hello bug!!!
in this course Using only uikit programatic way


# Bankey first iOS business  application 

First create project and save it repository 
Working with no storyboard
1. Remove files 
2. Upate info.plist 
3. Update app delegate.swift 

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

## Adding textField
- we define textField delegate using delefation pattern 
- add some function to be conformable 
- functions are based on editing

## Adding stackView
- !!! using stackView you can reach to minimize constraints That means less code
- embed in stackview all view elements we can give spacing themm equally
- remove the intrinsicContentSize property because we added stackview that takes resposibility 

## Adding the divider

- Core Animation happens in CALayer
- CALayer is under the UIView 


## Adding Sign/Log in Button 

- we add the button in the controller becuase viewController take the action with app like when button pressed behind the scene conroller gets fired. We may add LOGINVIEW However then we need delegation pattern 

## Bankey Handling Login 

- making an error label in red color 


## Bankey Login Logic
 
 - we add password and username computed property 
 - tackle with logic
 - now learing validation textfield in uikit 
 - in validation we treat thing as hard coded , but it's gonna be change maybe in future setting up with firebase framework 


## Saving our work 
 
 - ignoring files using .gitignore
