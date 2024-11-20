//
//  ProductSelectionView.swift
//  Cinepolis
//
//
import SwiftUI

struct ProductSelectionView: View {
    @ObservedObject var cart = CartData.shared
    
    var total: Int {
        cart.products.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                // Secciones de categorías
                CategorySectionView(title: "Palomitas", products: popcorns, cart: cart)
                CategorySectionView(title: "Bebidas", products: drinks, cart: cart)
                CategorySectionView(title: "Golosinas", products: candies, cart: cart)
            }
            
            // Total y botón para ir al carrito
            VStack {
                Text("Total: $\(total)")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                NavigationLink(destination: SummaryView()) {
                    Text("Ir al Carrito")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle("Productos")

    }
}

// Componente para las Secciones de Categorías
struct CategorySectionView: View {
    let title: String
    let products: [Product]
    @ObservedObject var cart: CartData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) { // Espaciado aumentado
                    ForEach(products) { product in
                        ProductCardView(product: product, isSelected: cart.products.contains(product))
                            .onTapGesture {
                                if cart.products.contains(product) {
                                    cart.removeProduct(product)
                                } else {
                                    cart.addProduct(product)
                                }
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

// Componente para las Tarjetas de Productos
struct ProductCardView: View {
    let product: Product
    let isSelected: Bool

    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                )
                .padding(4)
            
            Text(product.name)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text("$\(product.price)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 90, height: 120)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
