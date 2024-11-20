//
//  CartData.swift
//  Cinepolis
//

//

import Foundation

class CartData: ObservableObject {
    static let shared = CartData()
    
    @Published var tickets: [String: Int] = [:] // Ejemplo: ["Adulto": 2, "Niño": 1]
    @Published var products: [Product] = []
    @Published var productQuantities: [UUID: Int] = [:]
    
    private let ticketsKey = "ticketsKey"
    private let productsKey = "productsKey"
    
    init() {
        loadCart()
    }
    
    func saveCart() {
        let ticketsData = try? JSONEncoder().encode(tickets)
        UserDefaults.standard.set(ticketsData, forKey: ticketsKey)
        
        let productsData = try? JSONEncoder().encode(products)
        UserDefaults.standard.set(productsData, forKey: productsKey)
    }
    
    func loadCart() {
        if let ticketsData = UserDefaults.standard.data(forKey: ticketsKey),
           let savedTickets = try? JSONDecoder().decode([String: Int].self, from: ticketsData) {
            tickets = savedTickets
        }
        
        if let productsData = UserDefaults.standard.data(forKey: productsKey),
           let savedProducts = try? JSONDecoder().decode([Product].self, from: productsData) {
            products = savedProducts
            updateQuantities()
        }
    }
    
    func updateQuantities() {
        productQuantities = [:]
        for product in products {
            productQuantities[product.id, default: 0] += 1
        }
    }
    
    func addProduct(_ product: Product) {
        products.append(product)
        productQuantities[product.id, default: 0] += 1
        saveCart()
    }
    
    func removeProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            if let count = productQuantities[product.id], count > 1 {
                productQuantities[product.id]! -= 1
            } else {
                productQuantities.removeValue(forKey: product.id)
            }
        }
        saveCart()
    }
}
