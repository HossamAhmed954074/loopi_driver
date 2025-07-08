# Loopi Driver Application

The **Loopi Driver Application** is designed to help bus drivers efficiently manage their routes, bookings, and earnings. Built with **Flutter**, the app provides an intuitive interface for drivers to view, accept, or reject ride requests, track their earnings, and get real-time updates on their routes and customers.

## Features

- **Manage Routes**: View the available bus routes and the schedules for each route.
- **Ride Requests**: Accept or reject ride requests based on availability.
- **Real-time Updates**: Get real-time updates on new bookings and changes in the schedule.
- **Earnings Tracking**: Track earnings for completed trips and view detailed transaction history.
- **Push Notifications**: Get notified when new bookings are assigned or when there's a schedule update.
- **User-Friendly Interface**: Simple and easy-to-navigate interface for a smooth driver experience.

## Technologies Used

- **Flutter**: The mobile framework used to build the app.
- **Dart**: The programming language for development.
- **Firebase**: For backend services including real-time updates, authentication, and data storage.
- **Google Maps SDK**: For route visualization and navigation.
- **Push Notifications**: Firebase Cloud Messaging for real-time alerts.
- **Firestore**: For storing ride data and tracking bookings.

## Installation

### Prerequisites

Before running the project, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE like **Android Studio** or **VSCode**.

### Firebase Setup

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project and link your Flutter project with Firebase (Android/iOS).
   - Add your **google-services.json** (for Android) and **GoogleService-Info.plist** (for iOS) to the respective platform directories.

2. **Enable Firebase Authentication**:
   - In Firebase, enable **Email/Password Authentication** or **Google Sign-In** (depending on your sign-in method).

3. **Enable Firestore**:
   - Set up Firestore to store booking details, driver profiles, and earnings data.

4. **Enable Firebase Cloud Messaging (FCM)**:
   - Enable **FCM** for push notifications.

### Steps to Run the Project Locally

1. **Clone the repository**:
    ```bash
    git clone https://github.com/HossamAhmed954074/loopi_driver.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd loopi_driver
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Set up Firebase**:
    - Make sure you have followed the Firebase setup steps and added the necessary Firebase configuration files.

5. **Run the app**:
    - For **Android**:
      ```bash
      flutter run
      ```
    - For **iOS** (on macOS):
      ```bash
      flutter run
      ```

## Usage

Once the app is running:

- **Manage Routes**: View assigned routes and check the schedule for each trip.
- **Accept/Reject Ride Requests**: Receive ride requests and accept or reject them based on availability.
- **View Earnings**: Track your earnings from completed trips and see your daily or monthly earnings.
- **Push Notifications**: Get real-time notifications when new ride requests are made or when there are updates on your routes.

## BLoC Architecture

The app uses **BLoC** (Business Logic Component) pattern for efficient state management. It helps separate the app’s logic from the UI, ensuring scalability and maintainability.

### Key BLoC Components:

- **Authentication Bloc**: Manages the login and authentication states.
- **Route Bloc**: Manages the states of bus routes and schedules.
- **Booking Bloc**: Manages ride requests, including accepting or rejecting bookings.
- **Earnings Bloc**: Manages the tracking of the driver’s earnings.

## Contributing

We welcome contributions to improve this app! If you would like to help out, please fork the repository, make your changes, and submit a pull request.

### How to Contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push to your fork (`git push origin feature-name`).
5. Open a pull request.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or feedback, feel free to contact me:

- Email: eltohamehossam@gmail.com
- LinkedIn: www.linkedin.com/in/hossam-ahmed-ab4987248


---

Thank you for checking out **Loopi Driver Application**! We hope this app helps drivers efficiently manage their routes and bookings.

