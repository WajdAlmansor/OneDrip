import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            // العناصر الرئيسية: الهيدر + البيضاوي
            VStack {
                HStack {
                    Button(action: {
                        print("plus tapped")
                        // هنا تحط التنقل أو الوظيفة المطلوبة
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }

                    Spacer().frame(width: 80)

                    Text("Home")
                        .font(.custom("ArialRoundedMTBold", size: 36))

                    Spacer().frame(width: 80)

                    Button(action: {
                        print("gear tapped")
                        // هنا برضو تقدر تفتح صفحة إعدادات مثلاً
                    }) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                }
                .padding()

                Spacer()

                Ellipse()
                    .fill(Color(hex: "B0E0E6"))
                    .frame(width: 540, height: 374)
                    .offset(y: 100)
            }
            .padding()

            VStack {
                Text("Journeys")
                    .font(.system(size: 36, weight: .regular, design: .rounded))

                CarouselView()
                    .padding(.top, -70)

                HStack(spacing: 0) {
                    Text("See your first ")
                    Text("vs")
                        .foregroundColor(Color(hex: "F88379"))
                    Text(" latest progress")
                }
                .font(.system(size: 21, weight: .regular, design: .rounded))
                .offset(y: -80)
            }
        }
    }
}

#Preview {
    Home()
}
