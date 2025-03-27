import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    AppBar() // AppBar now uses the EnvironmentObject from the root view
                    SearchView1()
                    ImageSliderView()
                    HStack {
                        Text("New Rivals")
                            .font(.title2)
                            .fontWeight(.medium)
                        Spacer()
                        
                        Image(systemName: "circle.grid.2x2.fill")
                            .foregroundColor(Color("kPrimary"))
                    }
                    .padding()
                    
                    // In HomePageView.swift
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(productList, id: \.id) { product in
                                NavigationLink {
                                    Text(product.name)
                                } label: {
                                    ProductCartView(product: product)
                                        .environmentObject(cartManager)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .environmentObject(cartManager) // Pass the environment object down the view hierarchy
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of CartManager and pass it to the view
        HomePageView()
            .environmentObject(CartManager()) // Properly pass the CartManager to the preview
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            // AppBar content (location and cart)
            HStack {
                Image(systemName: "location.north.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
                Text("Kampala, Uganda")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Spacer()
                
                NavigationLink(destination: CartViewPage()
                    .environmentObject(cartManager)
                ) {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
            .padding() // Padding for AppBar
            
            // Text directly below the AppBar
            Text("Find the most \n Luxurious")
                .font(.largeTitle.bold())
            
            + Text(" Furniture")
                .font(.largeTitle.bold())
                .foregroundColor(Color("kPrimary"))
        }
    }
}
