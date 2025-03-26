//
//  SearchView.swift
//  marketplace
//
//  Created by Bravo on 25/03/2025.
//

import SwiftUI

struct SearchView1: View {
    @State private var search : String = ""
    
    
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search for Furniture",text: $search)
                    .padding()
                    
            }
            .background(Color("kSecondary"))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
        }
            .padding(.horizontal)
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView1()
    }
}
