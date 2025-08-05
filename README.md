# OneDrip 🌱

**OneDrip** is a habit-building iOS app that helps users grow their skills through consistent, minimal daily effort. The concept is inspired by the idea of small progress — one drop at a time — leading to meaningful, lasting change.

## 🧠 Concept

OneDrip encourages users to commit to a single goal and maintain a short daily routine. The experience is designed to be calming, focused, and motivating — using visuals, streaks, and gentle reminders to stay on track.

## 🔨 Current Development

This project is currently **in development**. Several key components have already been implemented and are included in the codebase:

- ✅ Full SwiftUI frontend with custom design elements and layout
- ✅ Journey setup screen that collects user input (goal, duration, daily time, start time)
- ✅ Apple Sign-In integration using `AuthenticationServices`
- ✅ CloudKit integration for:
  - Creating and saving user records
  - Saving and retrieving "Journey" entries in the public iCloud database
- ✅ Timeline-style scroll for daily reflections with support for notes, media, and voice input
- ✅ Carousel for navigating between multiple journeys
- ✅ Settings page with UI structure for account, notification, and privacy controls

All data is stored securely in **Apple’s CloudKit**, not Firebase. The app avoids third-party backend services and relies entirely on the Apple ecosystem.

## 🚀 How to Run the Project

1. Open the `.xcodeproj` or `.xcworkspace` file in **Xcode** (version 14 or later recommended).
2. Make sure you are signed in with a valid **Apple Developer account**.
3. Enable **iCloud** and **Sign In with Apple** capabilities for your app target.
4. Choose a real iOS device or simulator, then press **Run (⌘R)**.
5. For full CloudKit functionality and Apple Sign-In, test on a **physical device** signed in to iCloud.

---

Still growing — one drop at a time 💧  
Designed and built with intention by RW.
