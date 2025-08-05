import SwiftUI

struct JourneyDays: View {
    let totalDays = 10
    @State private var selectedDay: Int? = nil // ← مو محدد بالبداية

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            VStack {
                
                HStack {
                    Button(action: {
                        
                        print("رجوع")
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }

                    Spacer()

                    Text("Journey\nDays")
                        .multilineTextAlignment(.center)
                        .font(.custom("ArialRoundedMTBold", size: 36))
                    

                    Spacer()

                    Button(action: {
                        // أضف هنا أكشن المؤقت
                        print("الضغط على المؤقت")
                    }) {
                        Image(systemName: "timer")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                }

                .padding()

                GeometryReader { outerGeo in
                    ScrollViewReader { proxy in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 3)
                                .padding(.leading, 76.5)

                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 400) {
                                    ForEach(1...totalDays, id: \.self) { day in
                                        GeometryReader { geo in
                                            let midY = geo.frame(in: .global).midY
                                            let screenMidY = UIScreen.main.bounds.height / 2
                                            let distance = abs(midY - screenMidY)
                                            let scale = max(1.0 - (distance / 300), 0.8)
                                            let isSelected = selectedDay == day

                                            DayCircleView(day: day, isSelected: isSelected, scale: scale)
                                                .id(day)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading, 51.5)
                                                .onChange(of: distance < 50) { isClose in
                                                    if isClose {
                                                        selectedDay = day
                                                    }
                                                }
                                        }
                                        .frame(height: 140)
                                    }

                                    Spacer()
                                        .frame(height: UIScreen.main.bounds.height / 2)
                                }
                                .padding(.top, 100)
                            }
                            .gesture(
                                DragGesture()
                                    .onEnded { _ in
                                        if let selected = selectedDay {
                                            withAnimation(.easeInOut) {
                                                proxy.scrollTo(selected, anchor: .center)
                                            }
                                        }
                                    }
                            )
                        }
                    }
                }
            }
            .padding()
        }
    }
}








#Preview {
    JourneyDays()
}
