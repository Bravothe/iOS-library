//
//  HomePageView.swift
//  marketplace
//
//  Created by Bravo on 26/03/2025.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    AppBar()
                    SearchView1()
                    ImageSliderView()
                    HStack{
                        Text("New Rivals")
                            .font(.title2)
                            .fontWeight(.medium)
                        Spacer()
                        
                        Image(systemName: "circle.grid.2x2.fill")
                            .foregroundColor(Color("kPrimary"))
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(productList, id: \.id){product in
                                //this takes a user to the product details of the clicked product
                                NavigationLink{
                                    Text(product.name)
                                } label: {
                                    ProductCartView(product: product)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .environmentObject(CartManager())
            
        }
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
           
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
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
                    
                    NavigationLink(destination: Text("")) {
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
        .environmentObject(CartManager())
        .padding()
    }
}
