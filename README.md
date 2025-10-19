# 📱 Flutter Product Recommendation Chat App

**Version:** 1.0.0
**Status:** Production Ready ✅

A Flutter app that provides an AI-powered shopping assistant. Users can chat to get product recommendations with a clean and responsive UI.

---

## 🎯 Features

* Chat with AI assistant
* Smart product display with images, price badges, and availability status
* Auto-scroll and loading indicators
* Responsive design for mobile, tablet, and web
* Error handling and network timeout support

---

## 🏗️ Architecture

* **Clean Architecture (Simplified)**
* **State Management:** Built-in `setState`
* **Design Patterns:** Repository pattern, Widget composition, Model-View

**Folder Structure:**

```
lib/
├── main.dart
├── screens/         # HomeScreen
├── models/          # Product, ChatMessage
├── services/        # API calls
└── widgets/         # ChatBubble, ProductCard
```

---

## 🛠️ Technologies

* Flutter 3.x & Dart 3.x
* FastAPI backend
* Material Design 3
* Packages: `http`, `intl`

---

## 🚀 How to Run

```bash
git clone <repo-url>
cd flutter_product_recommender
flutter pub get
flutter run
```

**Platform Examples:**

```bash
flutter run -d chrome    # Web
flutter run -d android   # Android
flutter run -d ios       # iOS
```

---

## 🔧 Configuration

Set API endpoint in `lib/services/api_service.dart`:

```dart
static const String baseUrl = 'http://localhost:8000/api'; // Adjust as needed
```

---

## 🔐 Security

* Store API keys in environment variables
* Use HTTPS in production
* Validate user input
* Use secure storage for tokens

---

## 🤝 Contributing

1. Fork the repo
2. Create a branch
3. Commit changes
4. Push and open a Pull Request

---

## 📄 License

MIT License – Free to use for personal and commercial projects

---

## 👨‍💻 Author

Built with ❤️ using Flutter & FastAPI

