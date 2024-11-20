//
//  MovieData.swift
//  Cinepolis
//
//  
//

import SwiftUI

//Modelo para los actores (fotos)
struct Actor: Identifiable, Codable {
    var id = UUID()
    let name: String
    let image: String
}

// Modelo de película (datos peliculas)
struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let classification: String
    let duration: String
    let genre: String
    let synopsis: String
    let actors: [Actor]
}

// Modelo para Productos (Dulceria)
struct Product: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let price: Int
    let image: String
}

// Categorías de Productos de dulcería
let popcorns = [
    Product(name: "Palomitas para llevar", price: 95, image: "llevar"),
    Product(name: "Palomitas Jumbo", price: 85, image: "jumbo"),
    Product(name: "Palomitas Grandes", price: 80, image: "grandes"),
    Product(name: "Palomitas medianas", price: 95, image: "medianas"),
]

let drinks = [
    Product(name: "ICEE", price: 50, image: "icee"),
    Product(name: "Coca-Cola", price: 50, image: "coca"),
    Product(name: "Fanta", price: 50, image: "fanta"),
    Product(name: "Sprite", price: 50, image: "sprite")
]

let candies = [
    Product(name: "M&M's", price: 40, image: "mms"),
    Product(name: "Skittles", price: 35, image: "skittles"),
    Product(name: "Snickers", price: 30, image: "snickers")
]



// Lista de películas y detalles de cada una (Aqui se enlistan los actores también)
let movies: [Movie] = [
    Movie(
        title: "Gladiador II",
        image: "gladiador",
        classification: "PG-17",
        duration: "2h 18m",
        genre: "Acción",
        synopsis: "Años después de presenciar la muerte del venerado héroe Máximo a manos de su tío, Lucio se ve obligado a entrar en el Coliseo después de que su hogar sea conquistado por los titánicos Emperadores que ahora dirigen Roma con puño de hierro.",
        actors: [
                    Actor(name: "Paul Mescal.", image: "paul"),
                    Actor(name: "Pedro Pascal", image: "pedro"),
                    Actor(name: "Denzel Washington", image: "denzel")
                ]
    ),
    Movie(
        title: "El tiempo que tenemos",
        image: "tiempo",
        classification: "PG-15",
        duration: "2h 18m",
        genre: "Drama,Romance",
        synopsis: "Almut y Tobias coinciden inesperadamente en un encuentro que cambia sus vidas. A través de fragmentos enamorándose, construyendo un hogar, formando una familia, se revela una difícil realidad que sacude los cimientos de su relación. Mientras emprenden un camino desafiado por los límites del tiempo, aprenden a valorar cada momento del recorrido.",
        actors: [
                    Actor(name: "Andrew Garfield", image: "andrew"),
                    Actor(name: "Florence Pugh", image: "florence")
                ]
    ),
    Movie(
        title: "Avengers: Endgame",
        image: "avengers",
        classification: "PG-13",
        duration: "3h 1m",
        genre: "Acción, Aventura",
        synopsis: "Después de los eventos devastadores de Infinity War, los Vengadores intentan revertir las acciones de Thanos.",
        actors: [
                    Actor(name: "Robert Downey Jr.", image: "rdj"),
                    Actor(name: "Chris Evans", image: "chrisevans"),
                    Actor(name: "Mark Ruffalo", image: "markruffalo")
                ]
    ),
    Movie(
        title: "The Batman",
        image: "batman",
        classification: "PG-13",
        duration: "2h 56m",
        genre: "Acción, Crimen",
        synopsis: "Bruce Wayne, en su segundo año como Batman, investiga una serie de crímenes cometidos por un asesino en serie.",
        actors: [
                    Actor(name: "Robert Pattinson", image: "pattinson"),
                    Actor(name: "Zoë Kravitz", image: "zoe"),
                    Actor(name: "Paul Dano", image: "dano")
                ]
    ),
    Movie(
        title: "Spider-Man: No Way Home",
        image: "spiderman",
        classification: "PG-13",
        duration: "2h 28m",
        genre: "Acción, Aventura",
        synopsis: "Spider-Man enfrenta nuevos desafíos al intentar arreglar su identidad secreta con la ayuda del Doctor Strange.",
        actors: [
                    Actor(name: "Tom Holland", image: "tom"),
                    Actor(name: "Zendaya", image: "zendaya"),
                    Actor(name: "Tobey Maguire", image: "tobey"),
                    Actor(name: "Andrew Garfield", image: "andrew")
                ]
    )
]
