Questions:
* Clarify “all screenshots” as in every device’s screenshots?
* Should toggling filter the results or wait for search to be pressed?
    * Consider minimizing calls to the endpoint by filter results by formattedPrice == "Free" or not
    * Alternately, add it as a parameter for the search

Todos/Bugs:
* Apps.swift:
    * Remove unneeded elements once all wanted elements are identified
    * change names to things that make sense in the app. like icon instead of artworkUrl100
* AppDetailView.swift: If I should show screenshots for all devices, add additional collection views for each device
* AppDetailViewController.swift: 
    * scrollView height is currently hard coded. Make it dynamic
    * add a function to convert bytes to KB and MB. Currently only converting to KB
* Handle long titles in the tableview
* Bug: Price isn’t always showing up or showing up along the right side of the cell in the tableview (happened when searching Ramen filtered with Free but wasn’t consistently happening for the same cell/result)
* Wherever there’s a guard, add something to explain to user why nothing happened

Enhancements:
* Add a loading indicator
* Add something fun/useful to fill the blank space before the user searches for an app
* Use UserDefaults to store filter selections and last search
* Add an option to the free/paid toggle to show all results in a single list
* Add ability to look up a specific app
* Add a way to clear results
* Optimize for other devices? (iPad?, etc)
