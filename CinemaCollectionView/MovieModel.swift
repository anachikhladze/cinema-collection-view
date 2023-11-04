//
//  MovieModel.swift
//  CinemaCollectionView
//
//  Created by Anna Sumire on 03.11.23.
//

import UIKit

enum MovieGenre {
    case action
    case adventure
    case horror
    case comedy
    
    func stringValue() -> String {
        switch self {
        case .action:
            return "Action"
        case .adventure:
            return "Adventure"
        case .horror:
            return "Horror"
        case .comedy:
            return "Comedy"
        }
    }
}
    struct Movie {
        let name: String
        let rating: Float
        let description: String
        let certificate: String
        let runtime: String
        let release: Int
        let genre: MovieGenre
        let director: String
        var cast: [String]
        let image: UIImage?
        
        static let list = [
            Movie(name: "The Batman",
                  rating: 8.1,
                  description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
                  certificate: "16+",
                  runtime: "02:56",
                  release: 2022,
                  genre: .action,
                  director: "Matt Reeves",
                  cast: ["Robert Pattinson", "Zoë Kravitz", "Jeffrey Wright", "Colin Farrell", "Paul Dano", "John Turturro", "Andy Serkis", "Peter Sarsgaard"],
                  image: UIImage(named: "Cover-1")
                 ),
            Movie(name: "Uncharted",
                  rating: 7.9,
                  description: "The movie follows the adventures of Nathan Drake, a treasure hunter, and his partner Victor Sullivan as they search for a valuable historical artifact.",
                  certificate: "PG-13",
                  runtime: "02:00",
                  release: 2022,
                  genre: .adventure,
                  director: "Ruben Fleischer",
                  cast: ["Tom Holland", "Mark Wahlberg", "Antonio Banderas", "Sophia Taylor Ali", "Tati Gabrielle", "Rudhraksh Jaiswal", "Chaitanya Chopra", "Lidia Porto", "Vladimir Derisbourg", "Jonathan Cullen", "Marta Milans", "Steven Waddington", "Dwayne Johnson", "Keegan-Michael Key", "Robin Atkin Downes"],
                  image: UIImage(named: "Cover-2")!
                 ),
            Movie(name: "The Exorcism Of God",
                  rating: 5.6,
                  description: "An American priest working in Mexico is possessed during an exorcism and ends up committing a terrible act. Eighteen years later, the consequences of his sin come back to haunt him, unleashing the greatest battle within.",
                  certificate: "16+",
                  runtime: "01:38",
                  release: 2021,
                  genre: .horror,
                  director: "Alejandro Hidalgo",
                  cast: ["Hector Kotsifakis", "Will Beinbrink", "Oscar Flores"],
                  image: UIImage(named: "Cover-3")!
                 ),
            Movie(name: "Turning Red",
                  rating: 7.1,
                  description: "A comedy movie about a girl who turns into a giant red panda.",
                  certificate: "PG",
                  runtime: "01:42",
                  release: 2022,
                  genre: .comedy,
                  director: "Domee Shi",
                  cast: ["Rosalie Chiang", "Sandra Oh", "Ava Morse", "Maitreyi Ramakrishnan", "Helen Mirren"],
                  image: UIImage(named: "Cover-4")!
                 ),
            Movie(name: "Spider-Man: No Way Home",
                  rating: 8.1,
                  description: "A superhero movie where Spider-Man teams up with other Spider-People to face multiverse threats.",
                  certificate: "PG-13",
                  runtime: "02:28",
                  release: 2021,
                  genre: .action,
                  director: "Jon Watts",
                  cast: ["Tom Holland", "Zendaya", "Benedict Cumberbatch", "Jacob Batalon", "Marisa Tomei", "Willem Dafoe"],
                  image: UIImage(named: "Cover-5")!
                 ),
            Movie(name: "Morbius",
                  rating: 5.3,
                  description: "An action movie about Dr. Michael Morbius, a scientist who gains vampire-like abilities.",
                  certificate: "PG-13",
                  runtime: "02:08",
                  release: 2022,
                  genre: .action,
                  director: "Daniel Espinosa",
                  cast: ["Jared Leto", "Matt Smith", "Adria Arjona", "Jared Harris", "Tyrese Gibson"],
                  image: UIImage(named: "Cover-6")!
                 )
        ]
    }
