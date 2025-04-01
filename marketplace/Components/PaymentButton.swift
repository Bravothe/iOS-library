import SwiftUI

struct CustomPaymentButton: View {
    var action: () -> Void // Action to perform when button is clicked
    
    var body: some View {
        Button(action: {
            action() // Trigger the action passed from CartViewPage
        }) {
            Text("Payment Now 1")
                .fontWeight(.bold) // Make the label bold
                .padding() // Add padding for a better touch area
                .frame(maxWidth: .infinity) // Make the button stretch horizontally
                .background(Color.blue) // Set the background color (blue)
                .foregroundColor(.white) // Set the label color (white)
                .cornerRadius(10) // Rounded corners for the button
                .padding(.horizontal) // Horizontal padding for layout
        }
        .frame(height: 50) // Set a fixed height for the button
    }
}

struct CustomPaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaymentButton(action: {
            print("Proceed to Payment Button Pressed")
        })
            .frame(height: 50) // Define a height for the preview
            .padding() // Add padding around the button in the preview
    }
}
