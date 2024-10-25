import UIKit

struct Movie {
    
    let title: String
    let year: Int
    let genre: String
    let poster: UIImage
    
    init(title: String, year: Int, genre: String, posterName: String) {
        self.title = title
        self.year = year
        self.genre = genre
        self.poster = UIImage(named: posterName) ?? UIImage()
    }
    
}
