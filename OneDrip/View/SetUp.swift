import SwiftUI
import CloudKit

struct SetUp: View {
    @StateObject private var viewModel = SetUpViewModel()
    var onJourneySaved: () -> Void

    
    @AppStorage("hasCompletedSetup") private var hasCompletedSetup = false

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            Image(systemName: "drop.fill")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(viewModel.questions[viewModel.currentPage].dropColor)
                .font(.system(size: 640))
                .padding(.top, 270)

            VStack {
                Text("Let’s plan your \n journey")
                    .font(.custom("ArialRoundedMTBold", size: 36))
                    .multilineTextAlignment(.center)
                    .padding(.top, -330)

                Text("Tiny sessions build real talent")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(Color(hex: "A8A8A8"))
                    .multilineTextAlignment(.center)
                    .padding(.top, -250)
            }
            .padding(.top, 40)

            VStack(spacing: 16) {
                TabView(selection: $viewModel.currentPage) {
                    ForEach(viewModel.questions.indices, id: \.self) { index in
                        VStack(spacing: 8) {
                            QuestionTextView(text: viewModel.questions[index].question)

                            switch index {
                            case 0:
                                CustomTextFieldView(
                                    placeholder: "Name your skill",
                                    text: $viewModel.skillTitle
                                )
                            case 1:
                                MenuPickerView(
                                    options: ["7", "14", "21", "30"],
                                    selection: $viewModel.durationDays
                                )
                            case 2:
                                MenuPickerView(
                                    options: ["10", "15", "30", "60"],
                                    selection: $viewModel.dailyMinutes
                                )
                            case 3:
                                TimePickerButtonView(
                                    showPicker: $viewModel.showTimePicker,
                                    selectedTime: $viewModel.startTime,
                                    skill: .constant("")
                                )
                            default:
                                EmptyView()
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 580)

                if viewModel.currentPage == 3 {
                    Button(action: {
                        guard let duration = Int(viewModel.durationDays),
                              let minutes = Int(viewModel.dailyMinutes) else {
                            print("Invalid input")
                            return
                        }

                        CKContainer.default().fetchUserRecordID { recordID, error in
                            if let error = error {
                                print("Error fetching user record ID: \(error)")
                                return
                            }

                            guard let recordID = recordID else {
                                print("No user record ID found")
                                return
                            }

                            let userId = recordID.recordName

                            CloudKitJourneyManager.shared.saveJourney(
                                title: viewModel.skillTitle,
                                durationDays: duration,
                                dailyMinutes: minutes,
                                startDate: viewModel.startTime,
                                userId: userId
                            ) { result in
                                switch result {
                                case .success(let record):
                                    print("✅ Journey saved: \(record)")

                                    DispatchQueue.main.async {
                                        hasCompletedSetup = true  
                                        onJourneySaved()
                                    }

                                case .failure(let error):
                                    print("❌ Error saving journey: \(error)")
                                }
                            }
                        }
                    }) {
                        Text("Done")
                            .font(.custom("ArialRoundedMTBold", size: 24))
                            .foregroundColor(Color(hex: "333333"))
                            .frame(width: 104, height: 56)
                    }
                    .background(Color(hex: "FFFDD0"))
                    .cornerRadius(36)
                    .shadow(color: Color(hex: "333333").opacity(0.3), radius: 4, x: 0, y: 2)
                    .padding(.top, -55)
                }
            }

            VStack {
                Spacer()
                HStack(spacing: 12) {
                    ForEach(viewModel.questions.indices, id: \.self) { dotIndex in
                        Circle()
                            .fill(dotIndex == viewModel.currentPage ? Color.white : Color.white.opacity(0.4))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.bottom, 150)
            }
        }
    }
}


#Preview {
    SetUp {
        print("تم حفظ الجورنال في المعاينة.")
    }
}
