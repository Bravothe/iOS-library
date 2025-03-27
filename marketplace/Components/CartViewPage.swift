import SwiftUI

struct CartViewPage: View {
    @EnvironmentObject var cartManager: CartManager // Cart manager environment object
    @State private var showAlert = false // State to control showing the alert
    @State private var totalAmount: String = "" // Store the total amount for the popup

    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                // Loop through cart items
                ForEach(cartManager.products, id: \.id) { product in
                    CartProductView(product: product) // Assuming CartProductView is defined elsewhere
                }
                
                // Total Price Display
                HStack {
                    Text("Your total is ")
                    Spacer()
                    // Format the total as currency
                    Text("Ugx \(cartManager.total).00")
                        .bold()
                }
                .padding()

                // Custom Payment Button
                CustomPaymentButton(action: {
                    // Set the total amount to display in the popup and show the alert
                    totalAmount = "Ugx \(cartManager.total).00"
                    showAlert.toggle()
                })
                .padding()
                
            } else {
                // Show message when cart is empty
                Text("Your Cart is empty")
                    .padding()
            }
        }
        .navigationTitle("My Cart")
        .padding(.top)
        .alert(isPresented: $showAlert) {
            // Popup alert to display total and your name
            Alert(
                title: Text("Payment Details"),
                message: Text("Total: \(totalAmount)\nName: Thembo Allan"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct CartViewPage_Previews: PreviewProvider {
    static var previews: some View {
        CartViewPage()
            .environmentObject(CartManager()) // Ensuring CartManager is passed as an environment object
    }
}
