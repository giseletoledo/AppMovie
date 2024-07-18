//
//  ViewController.swift
//  TIC-ConsumoAPI-Template
//
//  Created by Marina De Pazzi on 06/04/23.
//  Modified by Geovana Contine on 10/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var service: APIService = APIService()
    private var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        service.fetchAllMovies(completionBlock: { movies, error in
            guard let movies = movies else { return }
            self.movies = movies.search
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetails", sender: indexPath)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") else { return UITableViewCell() }
            
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.textLabel?.font = .preferredFont(forTextStyle: .body)
        cell.detailTextLabel?.text = String("Release: \(movie.year)")
        
        return cell
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails", let indexPath = sender as? IndexPath {
            let destination = segue.destination as! DetailViewController
            
            let movie = movies[indexPath.row]
            destination.movie = movie
        }
    }
}
