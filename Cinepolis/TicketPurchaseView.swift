//
//  TicketPurchaseView.swift
//  Cinepolis
//

import SwiftUI

struct TicketPurchaseView: View {
    @ObservedObject var cart = CartData.shared
    @State private var adultTickets = 1
    @State private var childTickets = 1
    
    let movie: Movie // Recibe la película seleccionada

    var total: Int {
        (adultTickets * 84) + (childTickets * 69)
    }
    
    var body: some View {
        VStack {
            // Información de la película
            HStack(alignment: .top) {
                Image(movie.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .font(.title3)
                        .bold()
                    Text("Duración")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Text(movie.duration)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            
            Divider()
            
            // Sección de boletos
            VStack(alignment: .leading, spacing: 16) {
                Text("Boletos")
                    .font(.headline)
                    .padding(.horizontal)
                
                TicketRowView(title: "Adulto", price: 84, quantity: $adultTickets)
                TicketRowView(title: "Niños", price: 69, quantity: $childTickets)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Total a pagar
            VStack(spacing: 8) {
                Text("Total: $\(total)")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 8)
                
                // Botón de continuar
                NavigationLink(destination: ProductSelectionView()) {
                    Text("Continuar")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.bottom)
        }
        .navigationTitle("Compra de Boletos")
    }
}

// Componente reutilizable para los renglones de boletos
struct TicketRowView: View {
    let title: String
    let price: Int
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text("$\(price)")
                .foregroundColor(.gray)
            HStack {
                Button(action: {
                    if quantity > 0 { quantity -= 1 }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(quantity > 0 ? .blue : .gray)
                        .font(.title3)
                }
                
                Text("\(quantity)")
                    .font(.headline)
                    .frame(width: 40, alignment: .center)
                
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
        }
        .padding(.vertical, 8)
    }
}
