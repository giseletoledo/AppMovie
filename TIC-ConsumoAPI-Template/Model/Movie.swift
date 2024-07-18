//
//  Movie.swift
//  TIC-ConsumoAPI-Template
//
//  Created by Marina De Pazzi on 02/05/23.
//  Modified by Geovana Contine on 10/04/24.
//

import Foundation

struct MovieResponse: Decodable {// busca de array de movies
    let search: [Movie] //retorna um array de movie no objeto search
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"//na API é com letra maiuscula
    }
}

struct Movie: Decodable {//um titulo de movie
    var id: String
    var title: String
    var year: String
    var posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID" //nomes na API OMDB
        case title = "Title"
        case year = "Year"
        case posterPath = "Poster"
    }
}
