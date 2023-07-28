# Pepcrons Finance App

Welcome to Pepcrons Finance, a powerful and user-friendly Flutter app that provides comprehensive insights into the world of finance. This app allows you to explore stock histories, view key financial metrics of companies, discover top gainers/losers, and make strategic investment decisions.

## Features

- Explore Stock History: Discover the stock history of various companies with detailed candlestick charts for different time frames.

- Company Overview: Get key financial metrics, historical achievements, and 52-week high/low prices for any company.

- Top Assets: Discover top gainers, top losers, and most actively traded assets in the market.

## APIs Used

The app uses the following Alpha Vantage APIs:

1. Daily for Chart: 
   - URL: https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&outputsize=full&apikey=YOUR_API_KEY
   - Description: This API provides daily historical stock data for a given symbol (e.g., IBM) with the option to retrieve the full dataset.

2. Company Overview:
   - URL: https://www.alphavantage.co/query?function=OVERVIEW&symbol=IBM&apikey=YOUR_API_KEY
   - Description: This API provides an overview of a specific company (e.g., IBM) including key financial metrics, historical achievements, and more.

3. Top Gainers, Losers, and Most Actively Traded Tickers (US Market):
   - URL: https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=YOUR_API_KEY
   - Description: This API provides data for the top gainers, top losers, and most actively traded tickers in the US market.

## Dependencies

The app uses the following packages as dependencies:

- `cupertino_icons: ^1.0.2`: A set of Cupertino icons for Flutter.

- `firebase_core: ^2.15.0`: Firebase core library for initializing Firebase services.

- `firebase_auth: ^4.7.2`: Firebase authentication library for user authentication.

- `provider: ^6.0.5`: A state management package for Flutter apps.

- `http: ^0.13.6`: A package for making HTTP requests.

- `syncfusion_flutter_charts: ^22.2.5`: Syncfusion charts library for beautiful and interactive charts.

- `video_player: ^2.2.5`: A package for displaying videos in Flutter apps.

## Dev Dependencies

The app uses the following package as a dev dependency:

- `flutter_launcher_icons: ^0.13.1`: A package for easily updating the app launcher icons for both Android and iOS.

## Flutter APK

In this repository, you can find the Flutter APK (`app-release.apk`) file. This APK is a compiled version of the Pepcrons Finance app and can be installed on Android devices to test the app without building it from the source code.

To install the APK on your Android device, download the `app-release.apk` file and follow these steps:

1. Enable "Unknown Sources" in your device's settings to allow installation of apps from sources other than the Play Store.

2. Locate the `app-release.apk` file on your device and tap on it to begin the installation.

3. Follow the on-screen instructions to install the app.

Please note that this APK is a release build, and some features like hot-reloading and debugging may not be available in this version. For full development and testing capabilities, it's recommended to build and run the app using Flutter directly.

## Installation

1. Clone this repository.

2. Ensure you have Flutter installed. If not, follow the Flutter installation guide: https://flutter.dev/docs/get-started/install

3. Run `flutter pub get` in the terminal to install the required dependencies.

4. Update the app icon by running `flutter pub run flutter_launcher_icons:main`.

5. Replace the placeholder API keys with your actual Alpha Vantage API keys in the relevant API URLs.

6. Run the app on your preferred device/emulator with `flutter run`.

## Contributions

Contributions to the Pepcrons Finance app are welcome! If you find any issues or have suggestions for improvements, please feel free to create an issue or submit a pull request.

## License

This app is released under the MIT License. See the [LICENSE](LICENSE) file for more details.

