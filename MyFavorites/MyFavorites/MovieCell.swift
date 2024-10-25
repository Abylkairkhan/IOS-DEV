//
//  MovieCell.swift
//  MyFavorites
//
//  Created by Abylkairkhan Sarsetayev on 23.10.2024.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with movie: Movie) {
        movieImage.image = movie.poster
        titleLabel.text = movie.title
        yearLabel.text = String(movie.year)
        genreLabel.text = movie.genre
    }
    
}
