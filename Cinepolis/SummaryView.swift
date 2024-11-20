//
//  SummaryView.swift
//  Cinepolis
//
//  Created by Edson Maya Méndez on 18/11/24.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var cart = CartData.shared

    var total: Int {
        // Suma total de boletos y productos
        let ticketTotal = (cart.tickets["Adulto"] ?? 0) * 84 + (cart.tickets["Niño"] ?? 0) * 69
        let productTotal = cart.products.reduce(0) { $0 + $1.price }
        return ticketTotal + productTotal
    }

    var body: some View {
        VStack {
            List {
                // Resumen de Boletos
                if let adultCount = cart.tickets["Adulto"], adultCount > 0 {
                    Section(header: Text("Boletos").font(.headline)) {
                        HStack {
                            Text("Adulto (\(adultCount))")
                                .font(.body)
                            Spacer()
                            Text("$\(adultCount * 84)")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                    }
                }
                if let childCount = cart.tickets["Niño"], childCount > 0 {
                    HStack {
                        Text("Niño (\(childCount))")
                            .font(.body)
                        Spacer()
                        Text("$\(childCount * 69)")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                }

                // Resumen de Productos
                Section(header: Text("Alimentos").font(.headline)) {
                    ForEach(cart.products) { product in
                        HStack {
                            Text("(\(cart.productQuantities[product.id] ?? 1)) \(product.name)")
                                .font(.body)
                            Spacer()
                            Text("$\(product.price * (cart.productQuantities[product.id] ?? 1))")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            }
            //.listStyle(InsetGroupedListStyle())
            
            Spacer()
            
            // Nota y Total
            VStack(alignment: .leading, spacing: 16) {
                Text("Algunos productos podrán ser entregados en envases o presentaciones diferentes a las mostradas en el menú, lo anterior sin mermar su calidad y cantidad.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                HStack {
                    Text("Total (IVA incluido):")
                        .font(.headline)
                    Spacer()
                    Text("$\(total)")
                        .font(.headline)
                        .bold()
                }
                .padding(.horizontal)
            }
            .padding(.vertical)

            // Botón para realizar compra
            Button(action: {
                // Acción para realizar la compra
            }) {
                Text("Realizar compra")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("Carrito de compra")
    }
    
    // Función para eliminar un producto
    func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let product = cart.products[index]
            cart.removeProduct(product)
        }
    }
}
