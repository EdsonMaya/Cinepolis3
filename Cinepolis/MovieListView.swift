//
//  MovieListView.swift
//  Cinepolis
//
//  
//

import SwiftUI
    
struct MovieListView: View {
    var body: some View {
        
        
        //CARTELERA
                ZStack {
                // Fondo azul para la safeArea tambien
                    LinearGradient(
                        gradient: Gradient(colors: [ Color("DarkBlue"),Color("DarkBlue2")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                            )
                        .edgesIgnoringSafeArea(.top) // Abarca toda la parte superior

                            HStack {

                                HStack(spacing: 4) {
                                    Text("Cinepolis")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .frame(height: 40) // Altura del componente
                        .padding(.bottom)
                
                
                //TAMPICO
                HStack {
                            Text("Tampico - 15.1 km")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding(.leading)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors:
                                [Color.blue.opacity(0.6), Color.blue]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(25)
                        .padding(.horizontal)
        
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    HStack {
                        Image(movie.image)
                            .resizable()
                            .frame(width: 100, height: 150)
                            .cornerRadius(8)
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text("Estreno")
                            .padding(.vertical, 3)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .frame( maxWidth: .infinity, alignment: .leading)
                            .font(.caption)
                            
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.genre)
                                .font(.subheadline)
                            Text(movie.duration)
                                .font(.subheadline)
                        }
                    }
                }
                // Botón "Comprar Boletos"
                NavigationLink(destination: TicketPurchaseView(movie: movie)) {
                    Text("Comprar Boletos")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Color("gris"))
                        .foregroundColor(.blue)
                        .font(.headline)
                        .cornerRadius(8)
                }
            }
        }
    }
}


#Preview {
    MovieListView()
}
