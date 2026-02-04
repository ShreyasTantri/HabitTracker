# Habit Tracker (SwiftUI)

A simple Habit Tracker app built using **SwiftUI** that allows users to add habits, mark them as completed, and persist data locally using **UserDefaults**.

---

## ✨ Features

- Add a new habit using a modal sheet
- Optional habit description
- Mark habits as completed
- Automatic persistence using UserDefaults
- Clean separation of View, ViewModel, and Model

---

## 🧱 Architecture

- **Model**: `Habit` (Codable, Identifiable)
- **ViewModel**: `HabitsViewModel` (Observable, handles business logic & persistence)
- **Views**:
  - `HabitView` – Displays habit list
  - `AddHabitView` – Sheet for adding a new habit
  - `HabitRowView` – Single habit row UI

Uses **unidirectional data flow**:
- Views collect input
- ViewModel owns and mutates data
- Data persistence handled inside ViewModel

---

## 💾 Persistence

Habits are stored locally using `UserDefaults` by:
- Encoding `[Habit]` using `JSONEncoder`
- Saving encoded `Data`
- Decoding on app launch using `JSONDecoder`

Persistence is triggered automatically whenever the habits array changes.

---

## 🛠 Tech Stack

- Swift
- SwiftUI
- `@Observable`
- `@State`
- `NavigationStack`
- `UserDefaults`
- `Codable`

---

## 🚀 How It Works (High Level)

1. User taps **+**
2. `AddHabitView` sheet opens
3. User enters habit details
4. Habit is passed back via closure
5. ViewModel updates state
6. Data is saved automatically

---

## 📌 Notes

This project is intentionally kept simple and beginner-friendly, focusing on clarity and core SwiftUI concepts rather than complex persistence solutions like CoreData.

---

## 📄 License

Free to use for learning and personal projects.

