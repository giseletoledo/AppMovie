//
//  APIService.swift
//  TIC-ConsumoAPI-Template
//
//  Created by Marina De Pazzi on 20/04/23.
//  Modified by Geovana Contine on 10/04/24.
//  Modified by Gisele on 17/07/24

import Foundation
import UIKit

struct APIService {
    
    let url = URL(string:"http://www.omdbapi.com/?apikey=7f301f97&s=Steve+Jobs")
    
    func fetchAllMovies(completionBlock: @escaping ((MovieResponse?, Error?) -> Void)) {
        // Use a seguinte API: https://www.omdbapi.com
        // Sugestão: procure por todos os filmes que possuem "Steve Jobs" no título.
        guard let url else { return }
        URLSession.shared.dataTask(with: url) { data, response,error in
            guard let data else { return }
            do {
                let result = try JSONDecoder().decode(MovieResponse.self,from: data)// transforma json em Swift
                //print(result)
                completionBlock(result, nil)
            } catch (let error){
                print(error)
            }
            
        }.resume()
        
    }
}
