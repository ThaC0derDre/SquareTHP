
#SquareTHP (Take Home Project)
by Andres Gutierrez

## Build tools & versions used
- Xcode (14.0)
- SwiftUI

## Steps to run the app
- Pick simulator and hit run for app working with correct JSON url.
- To change url, hit (cmd + shift + o) and enter "EmployeeDownloader"
        or, navigate to it: SquareTHP/SquareTHP/Utilities/EmployeeDownloader,
        Then, on line 32 change "goodUrl" to "badUrl" or "emptyUrl"
        
## What areas of the app did you focus on?
- On UI, however ran into some issues getting the effect I was attempting 😅

## What was the reason for your focus? What problems were you trying to solve?
- I had envisioned the functionality of the UI to behave a certain way, but found errors with implementation. What's called "matchedGeographyEffect" was having some funky behaviors. To stay within given time limit, I had to cut it out of the project 😕
- Another issue I noticed and didn't find the solution to in time was with selecting an employee at the bottom of the list. When the cell expands, I couldn't get the cell to fit in the screen
- And lastly, I didn't like the new funtionality with pulling down to refresh. The nav title jumps up, but because user is holding on to scrollView, the scroll view stays.

 **UPDATE**
I ended up fixing the first two problems! 🍾
    The desired effects didn't play well with Swift's "List". Had to ditch it!

## How long did you spend on this project?
- About 5 - 6 hours, trying do solve those two problems had me go over the desired time.

## Did you make any trade-offs for this project? What would you have done differently with more time?
- I would spend more time on the Empty View Screen. Looks pretty plain even with the Lottie Animation. 
- I would also focus more on the main UI. I wanted to find a nicer way to present the cards, and also the cells

## What do you think is the weakest part of your project?
- I think the main ui is a little basic. I would have loved to show some character and style that isn't so default.

## Did you copy any code or dependencies? Please make sure to attribute them here!
- In EmployeeCells, I copied the very bottom function, along with the @Binding property and isSelected computed property from a previous project of mine. This functionality I used to tell the parent view which employee was selected. The previous project was quite different apart from this. See: https://github.com/ThaC0derDre/ProjectSample and the video is labeled "Making.A.Schedule.mp4"
- Though that was the only copy/paste, a lot of code was inspired by my previous projects including tutorials I've completed. I did have to look back to refresh on how to cache and parse JSON with combine, as well as remember how to add in the LottieAnimation.

## Is there any other information you’d like us to know?
- I did initially learn UIKit, but I had jumped to SwiftUI early 2022, and that has been my focus as it produces results much faster and I believe may be the future.
- I'm incredibly thankful for the opportunity and for the challenge! 
