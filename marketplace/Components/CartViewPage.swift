import SwiftUI

struct CartViewPage: View {
    @EnvironmentObject var cartManager: CartManager // Correct capitalization

    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                // Loop through cart items
                ForEach(cartManager.products, id: \.id) { product in
                    CartProductView(product: product) // Assuming ProductCartView is defined elsewhere
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
                
                PaymentButton(action: {})
                    .padding()
                
            } else {
                // Show message when cart is empty
                Text("Your Cart is empty")
                    .padding()
            }
        }
        .navigationTitle("My Cart")
        .padding(.top)
    }
}

struct CartViewPage_Previews: PreviewProvider {
    static var previews: some View {
        CartViewPage()
            .environmentObject(CartManager()) // Ensuring the CartManager is passed as an environment object
    }
}
