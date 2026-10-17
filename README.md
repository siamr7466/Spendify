# 💸 Expense Tracker (Flutter)

A functional expense tracking mobile application built with **Flutter** and **Dart**.  
Designed with a clean, modern UI and powered by **Provider** for state management and **SharedPreferences** for local persistence.

---

## 📱 Screenshots

| Get Started | Home | Add Transaction |
| :---: | :---: | :---: |
| <img src="screenshots/get_started.png" width="200"/> | <img src="screenshots/home.png" width="200"/> | <img src="screenshots/add.png" width="200"/> |

| Stats | Settings | Dark Mode |
| :---: | :---: | :---: |
| <img src="screenshots/stats.png" width="200"/> | <img src="screenshots/settings.png" width="200"/> | <img src="screenshots/dark_mode.png" width="200"/> |

*(Note: Add your own screenshots in a `screenshots/` folder to display them here).*

---

## 🚀 Features

### ✅ Fully Functional
- **Add Transaction**: Enter amount, select category, pick date, add description.
- **Home Dashboard**: Real-time calculation of Total Balance, Income, and Expenses.
- **State Management**: Uses `Provider` (ChangeNotifier) to sync data across screens instantly.
- **Local Persistence**: Data is saved using `SharedPreferences` (JSON serialization). Closing the app does not lose data.
- **Theme System**: Full Light / Dark mode support with a system-wide toggle.
- **Navigation**: Smooth flow from Get Started → Splash → Main Shell (Bottom Nav).

### 🎨 UI Only (Demo Data)
- **Stats Screen**: Bar chart, insight box, and top categories (Currently using demo data).
- **Monthly Spending Chart**: Donut chart on Home screen (Currently using demo data).
- **Settings Screen**: UI complete. Dark mode works. Other options (Currency, Export) are placeholders.

---

## 🛠️ Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Provider
- **Local Storage:** SharedPreferences
- **Charts:** fl_chart
- **SVG Rendering:** flutter_svg

---

## 📂 Project Structure (MVVM)

```text
lib/
├── model/                  # Data models (Transaction)
├── view_model/             # State management (ThemeProvider, TransactionProvider)
├── view/
│   ├── auth/               # Get Started Screen
│   ├── splash/             # Splash Screen
│   ├── shell/              # Main Shell & Bottom Navigation
│   ├── screens/            # Home, Add, Stats, Settings Screens
│   └── widgets/            # Reusable UI components (Charts, Headers)
└── main.dart               # App entry point & Theme setup
