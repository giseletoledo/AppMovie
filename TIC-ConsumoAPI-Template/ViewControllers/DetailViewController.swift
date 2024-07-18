//
//  DetailViewController.swift
//  TIC-ConsumoAPI-Template
//
//  Created by Marina De Pazzi on 19/04/23.
//  Modified by Geovana Contine on 10/04/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var movie: Movie = Movie(id: "", title: "", year: "", posterPath: "")
    var movieService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateViewData()
        
        // Load movie poster
        fetchPoster()
    }
    
    private func fetchPoster(){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: self?.movie.posterPath ?? " ") else { return }//url da imagem
            if let data = try? Data(contentsOf: url) {
                       if let image = UIImage(data: data) {
                           DispatchQueue.main.async {// alteração na UI em thread especifica
                               self?.imageView.image = image
                           }
                       }
                   }
               }
    }
    
    private func updateViewData() {
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        
        imageView.layer.cornerRadius = 12
        
        textLabel.text = movie.title
        yearLabel.text = "Release: \(movie.year)"
    }
}
