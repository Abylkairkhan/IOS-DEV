//
//  ViewController.swift
//  MyFavorites
//
//  Created by Abylkairkhan Sarsetayev on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let movies: [Movie] = [
        Movie(title: "Inception", year: 2010, genre: "Sci-Fi", posterName: "wild_robot"),
        Movie(title: "Freedom", year: 2024, genre: "Action, Romance, Drama", posterName: "freedom"),
        Movie(title: "Inception", year: 2010, genre: "Sci-Fi", posterName: "inception"),
        Movie(title: "The Dark Knight", year: 2008, genre: "Action, Crime, Drama", posterName: "dark_knight"),
        Movie(title: "Interstellar", year: 2014, genre: "Sci-Fi, Adventure, Drama", posterName: "interstellar"),
        Movie(title: "Parasite", year: 2019, genre: "Thriller, Drama", posterName: "parasite"),
        Movie(title: "The Matrix", year: 1999, genre: "Sci-Fi, Action", posterName: "matrix"),
        Movie(title: "Forrest Gump", year: 1994, genre: "Drama, Romance", posterName: "forrest_gump"),
        Movie(title: "The Shawshank Redemption", year: 1994, genre: "Drama", posterName: "shawshank"),
        Movie(title: "Pulp Fiction", year: 1994, genre: "Crime, Drama", posterName: "pulp_fiction"),
        Movie(title: "Avengers: Endgame", year: 2019, genre: "Action, Sci-Fi", posterName: "endgame"),
        Movie(title: "Gladiator", year: 2000, genre: "Action, Drama", posterName: "gladiator")
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
