# ☁️ News Cloud App

A modern, high-performance news aggregation application built with **Flutter**. This app fetches real-time top headlines and allows users to filter news by categories, demonstrating clean architecture and efficient state management.

## 📱 Features

* **Live News Data:** Fetches top headlines from the US using [NewsAPI](https://newsapi.org/).
* **Category Filtering:** Browse news by topic: Business, Entertainment, Health, Science, Sports, and Technology.
* **Smooth UI:** Implements `CustomScrollView` and `Slivers` for a seamless scrolling experience.
* **Robust Error Handling:**
    * Graceful handling of network errors.
    * Fallback images for articles with missing media.
    * Pull-to-Refresh functionality to update data.
* **Performance Optimization:** Uses `cacheHeight` and `cacheWidth` for memory-efficient image rendering.

## 🛠️ Tech Stack & Concepts

* **Framework:** Flutter (Dart)
* **Networking:** `Dio` (for efficient HTTP requests)
* **State Management:** `FutureBuilder` (handling Asynchronous snapshots)
* **Architecture:**
    * **Service Layer:** Separated API logic (`NewsService`).
    * **Model Layer:** Strongly typed data models (`Article`, `CardStyle`).
    * **UI Layer:** Reusable widgets (`NewsListView`, `CategoryView`).
* **Routing:** Dynamic navigation passing category data between screens.

## 📸 Screenshots

| Home Screen | Category View |
|:-----------:|:-------------:|
| ![Home](https://via.placeholder.com/200x400?text=Home+Screen) | ![Category](https://via.placeholder.com/200x400?text=Category+View) |

## 🚀 Getting Started

Follow these steps to run the project locally.

### Prerequisites
* Flutter SDK installed ([Guide](https://docs.flutter.dev/get-started/install))
* A free API Key from [NewsAPI.org](https://newsapi.org/)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/news_cloud_app.git](https://github.com/YOUR_USERNAME/news_cloud_app.git)
    ```

2.  **Navigate to the project folder:**
    ```bash
    cd news_cloud_app
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Configure API Key:**
    * Open `lib/service/NewsService.dart`.
    * Replace the API key string with your own key:
    ```dart
    // In NewsService.dart
    Response response = await dio.get(
      '[https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY_HERE&category=$Category](https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY_HERE&category=$Category)',
    );
    ```

5.  **Run the app:**
    ```bash
    flutter run
    ```

## 📂 Project Structure