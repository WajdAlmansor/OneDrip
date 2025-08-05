import SwiftUI

class SetUpViewModel: ObservableObject {
    //@Published var skill: String = ""
    @Published var skillTitle: String = ""
    @Published var durationDays: String = ""
    @Published var dailyMinutes: String = ""
    @Published var startTime: Date = Date()
    @Published var currentPage: Int = 0
    @Published var showTimePicker: Bool = false
    @Published var selectedTime: Date = Date()
    
    let questions: [QuestionPage] = [
        QuestionPage(
            question: "What skill do you want to build?",
            dropColor: Color(hex: "5EB8D7"),
            options: nil
        ),
        QuestionPage(
            question: "How many days do you\n want to continue?",
            dropColor: Color(hex: "FFA89A"),
            options: ["7 days", "14 days", "21 days", "30 days"]
        ),
        QuestionPage(
            question: "How long is your daily session?",
            dropColor: Color(hex: "CFADE8"),
            options: ["10 mins", "15 mins", "30 mins", "1 hour"]
        ),
        QuestionPage(
            question: "When do you want to start\n your new habit each day?",
            dropColor: Color(hex: "ABE5BC"),
            options: ["Morning", "Afternoon", "Evening", "Before bed"]
        )
    ]
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: selectedTime)
    }
}


struct QuestionTextView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 24, weight: .regular, design: .rounded))
            .foregroundColor(Color(hex: "333333"))
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 32)
            .padding(.top, 330)
    }
}



struct CustomTextFieldView: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .frame(width: 258, height: 58)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "333333"), lineWidth: 2)
            )
            .padding(.top, 10)
    }
}




struct MenuPickerView: View {
    let options: [String]
    @Binding var selection: String

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selection = option
                }
            }
        } label: {
            HStack {
                Text(selection.isEmpty ? "Choose" : selection)
                    .foregroundColor(selection.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(width: 258, height: 58)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "333333"), lineWidth: 2)
            )
        }
        .padding(.top, 10)
    }
}


struct TimePickerButtonView: View {
    @Binding var showPicker: Bool
    @Binding var selectedTime: Date
    @Binding var skill: String

    var body: some View {
        Button {
            showPicker = true
        } label: {
            HStack {
                Text(skill.isEmpty ? "Pick a time" : formattedTime)
                    .foregroundColor(skill.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "clock")
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(width: 258, height: 58)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "333333"), lineWidth: 2)
            )
        }
        .padding(.top, 10)
        .sheet(isPresented: $showPicker) {
            VStack {
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding()

                Button("Done") {
                    showPicker = false
                    skill = formattedTime
                }
            }
            .presentationDetents([.fraction(0.45)])
        }
    }

    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: selectedTime)
    }
}

