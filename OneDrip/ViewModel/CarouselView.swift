
import SwiftUI

struct CarouselView: View {
    

    @State private var items: [CircleItem] = [
        CircleItem(text: "A"),
        CircleItem(text: "B"),
        CircleItem(text: "C"),
        CircleItem(text: "D"),
        CircleItem(text: "E"),
        CircleItem(text: "F")
    ]

    let colors: [Color] = [
        Color(hex: "5EB8D7"),
        Color(hex: "FFA89A"),
        Color(hex: "CFADE8")
    ]

    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0.0
    @GestureState private var isDragging = false

    var body: some View {
        ZStack {
            ForEach(visibleItems(), id: \.id) { item in
                let index = indexOf(item)
                let offsetIndex = circularOffset(from: currentIndex, to: index)
                let position = positionForOffset(offsetIndex)
                let realIndex = items.firstIndex(of: item)!
                let color = colors[realIndex % colors.count]

                CircleView(item: item, color: color)
                    .offset(
                        x: offsetIndex == 0 ? dragOffset + position.x : position.x,
                        y: position.y
                    )
                    .scaleEffect(position.scale)
                    .zIndex(position.z)
                    .animation(.easeInOut, value: dragOffset)
            }
        }
        .frame(height: 300)
        .gesture(
            DragGesture()
                .updating($isDragging) { _, state, _ in
                    state = true
                }
                .onChanged { value in
                    dragOffset = value.translation.width
                }
                .onEnded { value in
                    let threshold: CGFloat = 100
                    if value.translation.width < -threshold {
                        rotateRight()
                    } else if value.translation.width > threshold {
                        rotateLeft()
                    }
                    dragOffset = 0
                }
        )
    }

    func indexOf(_ item: CircleItem) -> Int {
        return items.firstIndex(of: item) ?? 0
    }

    func visibleItems() -> [CircleItem] {
        items.filter { item in
            let index = indexOf(item)
            let offset = circularOffset(from: currentIndex, to: index)
            return abs(offset) <= 1
        }
    }

    func circularOffset(from: Int, to: Int) -> Int {
        let count = items.count
        let rawOffset = to - from
        if rawOffset == 0 { return 0 }
        return rawOffset > 0
            ? (rawOffset <= count / 2 ? rawOffset : rawOffset - count)
            : (rawOffset >= -count / 2 ? rawOffset : rawOffset + count)
    }

    func rotateRight() {
        withAnimation {
            currentIndex = (currentIndex + 1) % items.count
        }
    }

    func rotateLeft() {
        withAnimation {
            currentIndex = (currentIndex - 1 + items.count) % items.count
        }
    }

    func positionForOffset(_ offset: Int) -> (x: CGFloat, y: CGFloat, size: CGFloat, scale: CGFloat, z: Double) {
        switch offset {
        case -1:
            return (-140, -40, 139, 0.9, 0)
        case 0:
            return (0, 0, 139, 1.0, 1)
        case 1:
            return (140, -40, 139, 0.9, 0)
        default:
            return (0, 0, 0, 0, -1)
        }
    }
}
