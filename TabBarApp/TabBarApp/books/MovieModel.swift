import UIKit

struct MovieModel {
    
    let title: String
    let year: Int
    let genre: String
    let overview: String
    let poster: UIImage
    let backDrop: UIImage
    
    init(title: String, year: Int, genre: String, overview: String, poster: UIImage, backDrop: UIImage) {
        self.title = title
        self.year = year
        self.genre = genre
        self.overview = overview
        self.poster = poster
        self.backDrop = backDrop
    }
    
}
