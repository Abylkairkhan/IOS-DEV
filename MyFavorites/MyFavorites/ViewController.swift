//
//  ViewController.swift
//  MyFavorites
//
//  Created by Abylkairkhan Sarsetayev on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    let movies: [Movie] = [
        Movie(title: "Inception", year: 2010, genre: "Sci-Fi", posterName: "wild_robot"),
        Movie(title: "The Matrix", year: 1999, genre: "Action", posterName: "matrixPoster"),
        Movie(title: "Interstellar", year: 2014, genre: "Sci-Fi", posterName: "interstellarPoster")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
}
