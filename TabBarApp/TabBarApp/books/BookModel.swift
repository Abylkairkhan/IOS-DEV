import UIKit

struct BookModel {
    
    let title: String
    let author: String
    let overview: String
    let poster: UIImage
    let pageCount: Int
    let year: Int
    let dimensions: String
    
    init(title: String, author: String, overview: String, poster: UIImage, pageCount: Int, year: Int, dimensions: String) {
        self.title = title
        self.author = author
        self.overview = overview
        self.poster = poster
        self.pageCount = pageCount
        self.year = year
        self.dimensions = dimensions
    }
    
}
