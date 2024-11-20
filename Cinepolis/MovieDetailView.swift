//
//  MovieDetailView.swift
//  Cinepolis
//
//  
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Imagen y Título de la Película
                Image(movie.image)
                    .resizable()
                    .frame(height: 250)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                
                // Información General
                Text("Clasificación: \(movie.classification)")
                Text("Duración: \(movie.duration)")
                Text("Género: \(movie.genre)")
                Text("Sinopsis:")
                    .bold()
                Text(movie.synopsis)
                    .padding(.bottom)
                
                // Lista de Actores
                Text("Actores")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(movie.actors) { actor in
                            VStack {
                                Image(actor.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                                Text(actor.name)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .navigationTitle("Detalles")
    }
}
