import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides : [String] = ["1","2","3","7","6"]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                // Uniform image size and rounded corners
                Image(slides[currentIndex])
                    .resizable()
                    .scaledToFill() // Makes sure the image fills the frame
                    .frame(maxWidth: .infinity, maxHeight: 180) // Uniform width and height
                    .clipped() // Ensures the image stays within the frame bounds
                    .cornerRadius(15) // Routed corners
            }
            
            // Page indicators at the bottom
            HStack {
                ForEach(0..<slides.count, id: \.self) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear {
            // Timer to switch images every 6 seconds
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}
