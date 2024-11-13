import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backDropImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    private var movie: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backDropImage.image = movie?.backDrop
        movieName.text = movie?.title
        if let movieYearTemp = movie?.year {
            movieYear.text = "Movie Year: " + String(movieYearTemp)
        } else {
            movieYear.text = "Movie Year: null"
        }
        movieGenre.text = "Genre: " + (movie?.genre ?? "null")
        movieOverview.text = movie?.overview
    }
    
    func configure(with movie: MovieModel?) {
        self.movie = movie
    }

}
