# Expense Tracker App using Flutter

## Introduction

The Expense Tracker App is designed to help users manage their expenses efficiently. Built with Flutter and leveraging Cubit from the `flutter_bloc` package for state management, this app offers a seamless and modern user experience. The app adheres to clean architecture principles, ensuring maintainability and scalability.

## Features

- **Add New Expenses**: Users can add new expenses by entering the amount, description, and selecting a category.
- **View All Expenses**: A comprehensive list of all expenses is available for users to review and manage their financial activities.
- **Total Expense Calculation**: The app provides a total sum of all recorded expenses, offering users insight into their spending habits.
- **Delete Expenses**: Users can remove any expense from the list if needed, maintaining an up-to-date record.
- **Expense Categories**: Users can categorize their expenses, making it easier to track spending in different areas.
- **Expense Filtering**: The app allows users to filter expenses by date, category, or amount, providing flexibility in viewing financial data.

## Technical Requirements

- **State Management**: Utilizes Cubit from the `flutter_bloc` package to manage the application's state efficiently.
- **Clean Architecture**: The codebase is organized with separate files for UI components, state management logic, and data models. This separation of concerns promotes a cleaner and more maintainable code structure.
- **User Interface**: The app features a modern and user-friendly design, ensuring intuitive navigation and interaction for the users.

## How to Use and Execute the Expense Tracker App

### Prerequisites

Before you can run the Expense Tracker App, ensure you have the following installed on your machine:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Cloning the Repository

1. Clone this repository using Git:

   ```bash
   git clone https://github.com/eng-mohamed-ibrahem/expense_tracker_app.git
   ```

2. Navigate into the project directory:

   ```bash
   cd expense_tracker_app
   ```

### Running the App

1. Make sure your device/emulator is connected and recognized by Flutter:

   ```bash
   flutter devices
   ```

2. Run the app using the following command:

   ```bash
   flutter run
   ```

### Building the App for Release

To build the app for release, run:

- For Android:

  ```bash
  flutter build apk --release
  ```

- For iOS:

  ```bash
  flutter build ios --release
  ```

Ensure you have set up your environment for building iOS apps, usually requiring Xcode on macOS.

### Troubleshooting

- If you encounter any issues during the build or execution process, ensure all dependencies are up-to-date by running:

  ```bash
  flutter pub get
  ```

- Check for any Flutter or Dart SDK updates:

  ```bash
  flutter upgrade
  ```

By following these steps, you can successfully use and execute the Expense Tracker App on your device or emulator.

## Conclusion

The Expense Tracker App serves as a reliable tool for users to monitor and manage their financial activities. By integrating Cubit for state management and following clean architecture principles, the app ensures a robust and scalable solution. With additional features like expense categorization and filtering, users can gain deeper insights into their spending patterns.
