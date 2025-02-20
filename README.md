# Movie Finder App - iOS Developer Coding Assessment

## Objective
This app allows users to search for movies from the OMDb API and displays the results in a list.

## Features:
    •    Search for movies by title.
    •    Display movie title, release year, and poster image in the list.
    •    Handle error cases (e.g., no results, network errors).
    •    Responsive layout for both smaller and larger screen sizes.
    •    Implement a loading state while fetching data.

## API Details:
    •    Base URL: https://www.omdbapi.com/
    •    GET Request: https://www.omdbapi.com/?s=[movie title]&apikey=[apikey]
    •    API Key: 8d6aa4ca
    
## Setup:
1. Clone this repository
2. Open in Xcode
3. Run the project on a simulator or device

## Architecture:
This iOS app follows the MVVM (Model-View-ViewModel) architecture, structured as follows:
    •    Model:
        ◦    Represents data structures like MovieSearchResponse, Movie, etc.
        ◦    Contains properties that map the response data received from the API (e.g., movie titles, release years, poster URLs).

    •    View:
        ◦    Responsible for UI rendering.
        ◦    Utilizes UIViewController to handle UI elements and UITableView for displaying the list of movies.
        ◦    Includes responsive UI that adapts to both smaller and larger screen sizes.

    •    ViewModel:
        ◦    Handles business logic, network requests, and data transformations.
        ◦    Contains protocols for data binding between the View and the ViewModel, ensuring the ViewController reacts to changes in the data.
        ◦    The ViewModel is responsible for managing the interaction between the UI (View) and the backend (NetworkManager).

Additionally, the app includes a Utilities folder for better code organization, containing the following components:

    •    Utilities:
        ◦    AlertManager: A class that manages alerts throughout the app.
        ◦    Constants: A centralised place for managing and updating constants like error messages, cellIdenitifiers etc.
        ◦    NetworkError: An enum to handle various network errors, including invalid URL, request errors, response issues, and other common network-related errors.
        ◦    APIConfig: Manages the base URL, API key, and constructs the full movie search URL string.

## Network Manager Service Layer
    •    NetworkManager:
        ◦    A singleton class that handles all network requests.
        ◦    Uses URLSession with a completionHandler to handle the response asynchronously
        ◦    Handles network errors, including different HTTP response status codes such as 400, 500, etc., to provide clear error handling to the user.

    •    MoviewSearchURL:
        ◦    Returns and handles two types of responses from the API:
            ⁃    True: A valid response containing movie search results.
            ⁃    False: An invalid response, typically when no results are found or there are too many results (e.g., "Too many results." or invalid query).

    •    Error handling:
        ◦    The app gracefully handles various network failures and error scenarios. Some of the handled errors include:
            ⁃    Missing Input: If the user does not provide any search term, the app prompts them to enter a movie title.
            ⁃    Invalid Input: If the user enters an invalid movie title or malformed request, an alert is displayed asking for a valid movie title.
            ⁃    Network Issues: Clear and user-friendly error messages are shown in case of connection problems (e.g., invalid URL, request failure, server-side issues).
            ⁃    Server/Client Errors: Errors such as 400 (client errors), 500 (server errors), 404 (not found), and others are properly managed, ensuring the app provides an appropriate response message.
            ⁃    Unknown Errors: In case of unknown errors, a general error message is displayed to the user, indicating that something went wrong.

## Error Handling
The app gracefully handles the following error conditions:
    •    Missing Input:  If the user does not provide any search term, a prompt encourages them to enter a movie title.
    •    Invalid Input: If the user provides invalid movie title, an alert encourages them to enter a correct movie title.
    •    Network Issues: Displays a user friendly message about connection problems and other issues like InvalidURL, invalidRequest, invalidResponse, clientError, serverError. unknownError,  etc for good user experience.

## UX Considerations
    •    Search Text Field: A simple search text field is placed at the top for users to search movies by title.
    •    Error Handling: Clear feedback to users on errors such conditions such as "No results found", "Network error”, and others.
    •    Loading Indicator: A spinner is displayed while fetching data from the API, ensuring user is aware of ongoing network operations. The spinner disappears once the data has been successfully fetched or if an error occurs.
    •    Responsive Layout: The app is designed to work well on different sreen sizes.

## Frameworks
    •    SDWebImage: For image loading and caching. (Added via Swift Package Manager)

## Contact
For any questions or feedback, feel free to reach out via email or GitHub.
