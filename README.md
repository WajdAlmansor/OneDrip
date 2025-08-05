# OneDrip 🌱

**OneDrip** is an iOS habit-tracking app that empowers users to build new skills through tiny, consistent daily progress. The experience is quiet, visual, and encouraging — designed around the metaphor of a single water drop nurturing growth.

## 🧠 Concept

Instead of overwhelming users with complex productivity systems, OneDrip focuses on minimal daily input:  
**"Just 1% better each day."**

It invites users to plan their journey, commit to a small daily session, and watch their streak grow over time — all through beautiful UI and personalized flow.

## 📱 Key Features

- 📆 **Personalized Journey Setup**:  
  Users define the skill they want to grow, how long they’ll commit, and how many minutes per day they’ll practice.

- 🧭 **Daily Check-in Timeline**:  
  Scroll through visual markers for each day of your journey. Tap a day to reflect and add notes, photos, or voice logs.

- 🎡 **Carousel of Journeys**:  
  Visually flip through multiple journeys and compare first vs latest progress.

- 🔐 **Apple Sign-In Integration**:  
  Secure and seamless onboarding via Sign In with Apple.

- ☁️ **CloudKit Storage**:  
  All journey data is stored in Apple CloudKit for sync across devices.

## 🧩 Tech Stack

- **Frontend**: SwiftUI
- **Authentication**: Sign in with Apple
- **Database**: CloudKit (via public Cloud Database)
- **Design Tools**: Figma
- **State Management**: `@AppStorage`, `@StateObject`, MVVM-ish
- **Other**: Custom components (carousel, day tracker, timers), dynamic color themes

## ✅ Current Progress

| Feature                            | Status      |
|------------------------------------|-------------|
| UI Design Implementation           | ✅ Completed |
| Apple Sign-In                      | ✅ Integrated |
| Journey Setup + CloudKit Save      | ✅ Working   |
| Timeline Scroll + Reflections      | ✅ Done      |
| Firebase Project                   | ✅ Created (for potential extension) |
| User Record Fetching               | ✅ Implemented |
| Journey Fetch + Display            | 🟡 In Progress |
| Entries Display                    | 🟡 In Progress |
| Notifications                      | 🔲 Not Started |
| Final Data Binding + Sync          | 🔲 In Progress |

## 🔧 Setup (Dev Environment)

1. Clone this repo into Xcode.
2. Make sure your Apple Developer account is connected.
3. Ensure the correct **iCloud capability** and **Sign In with Apple** are enabled.
4. Replace any placeholder CloudKit container IDs or app identifiers.
5. Run on a real device or simulator (iCloud and Apple Sign-In work best on-device).

## 🧠 Ideas for Future Additions

- 📊 Smart streak insights using AI (progress prediction, personalized motivation)
- 🗣️ Voice journaling with speech-to-text
- 📥 Export or share progress summaries
- 🔔 Custom habit reminders or accountability nudges

## 👤 Author

Developed with focus and vision by RW 💡  
*“Small steps. Real change.”*

---

