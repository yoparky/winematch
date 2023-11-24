# Wine & Dine Companion App

## Overview

The Wine & Dine Companion App is designed to enhance the culinary experience by providing expert wine and food pairing suggestions. This app is developed using Dart, offering a seamless and responsive user interface. The application serves three primary functions:

1. **Wine-Food Matching:** Suggests a food recipe that complements a user-selected wine.
2. **Recipe tracker:** Contains directions for various recipes that match with different types of wines.
3. **Wine Cellar Tracker:** Manages a rudimentary wine cellar tracker, allowing users to maintain a list and ratings of wines they own.

## Features
- Wine cellar: keeps track of user's wine cellar. Uses Google Firestore as a backend database to store a user photo, wine name, description, and rating. A search functionality allows users to quickly search wines saved in the cellar section based on the wine's name.
- Wine-food matching: selecting a grape type brings up the grape's introductory paragraph from Wikipedia using a [custom microservice that scrapes a given wikipedia article and returns information in the http response payload](https://github.com/yoparky/wiki-scraper-microservice). The app then outputs a shortlist of recommended food pairings.
- Recipe page: keeps track of various recipes. Uses Google Firestore as a backend database to store recipes and directions.
### Prerequisites

- Dart SDK
- Compatible IDE (e.g., Visual Studio Code, Android Studio)

### Installation

1. Clone the repository: git clone https://github.com/yourusername/wine-dine-companion-app.git
2. Navigate to the project directory: cd wine-dine-companion-app
3. Run the app: dart run

## Demo:
[Youtube Demo Link](https://www.youtube.com/watch?v=_MEo24YBFic)
