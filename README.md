AdolfoWeather 🌦️
=================

**AdolfoWeather** is a simple iOS application that displays the current weather for a user's location by integrating with a weather API. While the app may be straightforward, it demonstrates essential foundational knowledge in iOS development, including networking, UI design, and Core Location.

* * * * *

Features
--------

-   **Real-time Weather Data**: Fetches and displays the current weather using a RESTful weather API.

-   **Location Awareness**: Utilizes Core Location to get the user's current location and fetch relevant weather data.

-   **Clean and Responsive UI**: Designed with UIKit for a smooth and user-friendly experience.

* * * * *

Skills Demonstrated
-------------------

### 1\. **API Integration**

-   Integrated a RESTful weather API to fetch real-time weather data.

-   Used `URLSession` to handle asynchronous networking.

-   Parsed JSON responses to extract and display relevant weather information.

### 2\. **Core Location**

-   Implemented location permissions and services to obtain the user's current location.

-   Converted coordinates into meaningful location data using reverse geocoding.

### 3\. **UIKit**

-   Designed a clean, responsive interface using `UILabel`, `UIImageView`, and `UIButton`.

-   Adapted UI to reflect changes in weather data dynamically.

### 4\. **MVVM Architecture**

-   Organized the project using the **Model-View-ViewModel (MVVM)** pattern for better separation of concerns and scalability.

-   Managed API calls and data processing within the `ViewModel`.

### 5\. **Error Handling**

-   Incorporated robust error handling for API requests and location services, including alerts to guide users.

* * * * *

Technologies Used
-----------------

-   **Swift**: Primary programming language for iOS development.

-   **UIKit**: For designing and managing the user interface.

-   **Core Location**: To get the user's current location.

-   **URLSession**: For networking and API calls.

-   **JSONSerialization/Decodable**: To parse JSON data from the weather API.

* * * * *

How to Run the Project
----------------------

1.  Clone the repository:

    ```
    git clone https://github.com/Adolfo-David-Romero/AdolfoWeather.git
    ```

2.  Open the `AdolfoWeather.xcodeproj` file in Xcode.

3.  Update the API key:

    -   Obtain a free API key from OpenWeatherMap or any weather API of your choice.

    -   Replace the placeholder `YOUR_API_KEY` in the project with your actual key in the `WeatherService.swift` file.

4.  Build and run the app on a simulator or physical device.

* * * * *

Future Improvements
-------------------

-   Add a feature to display a weekly weather forecast.

-   Implement a dark mode theme for improved user experience.

-   Use SwiftUI to modernize the interface and simplify code.

-   Add unit tests to ensure app reliability.

* * * * *

Why This App Matters
--------------------

While AdolfoWeather is a simple weather app, it showcases fundamental knowledge required to build iOS applications, including:

-   **Networking Basics**: Understanding APIs, asynchronous calls, and JSON handling.

-   **User Location Management**: Gaining hands-on experience with Core Location.

-   **UIKit Proficiency**: Mastering key components for user interfaces.

-   **Scalable Design**: Laying a foundation for implementing advanced features using proper architectural patterns.

This project is an excellent starting point for anyone learning iOS development and demonstrates the foundational skills necessary to create more complex applications.

* * * * *

License
-------

This project is licensed under the MIT License. See the `LICENSE` file for details.
