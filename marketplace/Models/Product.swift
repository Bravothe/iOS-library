//
//  Product.swift
//  marketplace
//
//  Created by Bravo on 25/03/2025.
//

import Foundation

struct Product : Identifiable{
    var id = UUID()
    var name : String
    var image : String
    var description : String
    var suplier : String
    var price : Int
}

var productList = [
    Product(name: "Chairs",
            image: "1",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs 68756",
            image: "2",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs",
            image: "3",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs Plastci",
            image: "4",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Russian Chairs",
            image: "5",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs UK Made",
            image: "6",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs International",
            image: "7",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs Local",
            image: "8",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
    
    Product(name: "Chairs Bed Room",
            image: "9",
            description: "Suitable for modern rooms",
            suplier: "Kamwe Kamwe Supliers",
            price: 40000),
]


