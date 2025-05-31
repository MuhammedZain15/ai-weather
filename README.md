# AI Weather
AI Weather is a Flutter application that leverages AI and machine learning to provide advanced weather predictions and personalized user experiences. The app integrates with Firebase for authentication and user data, and communicates with a Python-based backend for AI-driven weather forecasting.

---

## 🎥 Demo Video

[![Watch the demo]](https://drive.google.com/file/d/1Zj-dr9TCWXyJRDH9WupxuW5NeNaGPNAw/view?usp=sharing)

---

## Key Technologies Used

- **Flutter**: For building cross-platform mobile applications.
- **Firebase**: Handles authentication, user data storage, and app initialization.
- **Flutter BLoC**: Implements state management using the BLoC (Business Logic Component) pattern.
- **Dio**: For robust HTTP networking and API integration.
- **Python (Flask, scikit-learn, numpy)**: Backend for AI/ML weather prediction.
- **WeatherAPI**: External API for real-time weather data.

## Project Architecture

The project follows a clean architecture approach, separating concerns into distinct layers:

- **Presentation Layer**: Uses Flutter widgets and BLoC for UI and state management.
- **Domain Layer**: Contains business logic, use cases, and repository interfaces.
- **Data Layer**: Handles data sources (remote APIs, Firebase) and repository implementations.
- **Core Layer**: Includes shared utilities, API managers, dependency injection, and routing.

### Data Flow

1. **User Authentication**: Managed via Firebase.
2. **Weather Data Fetching**: The app fetches weather data from WeatherAPI using the `ApiManger` class.
3. **AI Prediction**: Weather data is sent to a Python Flask backend, which uses a trained ML model (scikit-learn) to predict weather conditions.
4. **State Management**: All business logic and state transitions are managed using BLoC Cubits.
5. **User Data**: Usernames and other info are stored and retrieved from Firebase Firestore.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/MuhammedZain15/ai-weather.git
cd ai_weather
```

### 2. Python Backend Setup

Run these commands in the terminal to set up the Python environment for the AI backend:

```bash
python -m venv venv

# For Mac/Linux
source venv/bin/activate

# For Windows
venv\Scripts\activate

pip install Flask
pip show Flask
pip install numpy
pip install scikit-learn==1.3.2

python app.py
```

> **Note:** Make sure your backend server URL in the Flutter app matches the address and port where your Flask app is running.

### 3. Flutter App Setup

- Install Flutter dependencies:
  ```bash
  flutter pub get
  ```
- Run the app:
  ```bash
  flutter run
  ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

Let me know if you want to add more details (e.g., screenshots, API docs, or contribution guidelines)!
