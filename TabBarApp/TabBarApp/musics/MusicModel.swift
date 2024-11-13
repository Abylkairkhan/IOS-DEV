import UIKit

struct MusicModel {
    
    let poster: UIImage
    let name: String
    let author: String
    let listenedCount: String
    let duration: String
    
    init(poster: UIImage, name: String, author: String, listenedCount: String, duration: String) {
        self.poster = poster
        self.name = name
        self.author = author
        self.listenedCount = listenedCount
        self.duration = duration
    }
    
}
