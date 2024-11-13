import UIKit

class MoviesViewController: UITableViewController {

    @IBOutlet var moviesTableView: UITableView!
    
    var movies: [MovieModel] = [
        MovieModel(title: "Venom: The Last Dance", year: 2024, genre: "Science Fiction, Action, Adventure", overview: "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.", poster: .venom, backDrop: .venomBackdrop),
        MovieModel(title: "Catch Me If You Can", year: 2002, genre: "Drama, Crime", overview: "A true story about Frank Abagnale Jr. who, before his 19th birthday, successfully conned millions of dollars worth of checks as a Pan Am pilot, doctor, and legal prosecutor. An FBI agent makes it his mission to put him behind bars. But Frank not only eludes capture, he revels in the pursuit.", poster: .catchMeIfYouCan, backDrop: .catchMeIfYouCanBackdrop),
        MovieModel(title: "Shutter Island", year: 2010, genre: "Drama, Thriller, Mystery", overview: "World War II soldier-turned-U.S. Marshal Teddy Daniels investigates the disappearance of a patient from a hospital for the criminally insane, but his efforts are compromised by troubling visions and a mysterious doctor.", poster: .shutterIsland, backDrop: .shutterIslandBackdrop),
        MovieModel(title: "Venom: The Last Dance", year: 2024, genre: "Science Fiction, Action, Adventure", overview: "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.", poster: .venom, backDrop: .venomBackdrop),
        MovieModel(title: "Catch Me If You Can", year: 2002, genre: "Drama, Crime", overview: "A true story about Frank Abagnale Jr. who, before his 19th birthday, successfully conned millions of dollars worth of checks as a Pan Am pilot, doctor, and legal prosecutor. An FBI agent makes it his mission to put him behind bars. But Frank not only eludes capture, he revels in the pursuit.", poster: .catchMeIfYouCan, backDrop: .catchMeIfYouCanBackdrop),
        MovieModel(title: "Shutter Island", year: 2010, genre: "Drama, Thriller, Mystery", overview: "World War II soldier-turned-U.S. Marshal Teddy Daniels investigates the disappearance of a patient from a hospital for the criminally insane, but his efforts are compromised by troubling visions and a mysterious doctor.", poster: .shutterIsland, backDrop: .shutterIslandBackdrop),
        MovieModel(title: "Venom: The Last Dance", year: 2024, genre: "Science Fiction, Action, Adventure", overview: "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.", poster: .venom, backDrop: .venomBackdrop),
        MovieModel(title: "Catch Me If You Can", year: 2002, genre: "Drama, Crime", overview: "A true story about Frank Abagnale Jr. who, before his 19th birthday, successfully conned millions of dollars worth of checks as a Pan Am pilot, doctor, and legal prosecutor. An FBI agent makes it his mission to put him behind bars. But Frank not only eludes capture, he revels in the pursuit.", poster: .catchMeIfYouCan, backDrop: .catchMeIfYouCanBackdrop),
        MovieModel(title: "Shutter Island", year: 2010, genre: "Drama, Thriller, Mystery", overview: "World War II soldier-turned-U.S. Marshal Teddy Daniels investigates the disappearance of a patient from a hospital for the criminally insane, but his efforts are compromised by troubling visions and a mysterious doctor.", poster: .shutterIsland, backDrop: .shutterIslandBackdrop),
        MovieModel(title: "Venom: The Last Dance", year: 2024, genre: "Science Fiction, Action, Adventure", overview: "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.", poster: .venom, backDrop: .venomBackdrop),
        MovieModel(title: "Catch Me If You Can", year: 2002, genre: "Drama, Crime", overview: "A true story about Frank Abagnale Jr. who, before his 19th birthday, successfully conned millions of dollars worth of checks as a Pan Am pilot, doctor, and legal prosecutor. An FBI agent makes it his mission to put him behind bars. But Frank not only eludes capture, he revels in the pursuit.", poster: .catchMeIfYouCan, backDrop: .catchMeIfYouCanBackdrop),
        MovieModel(title: "Shutter Island", year: 2010, genre: "Drama, Thriller, Mystery", overview: "World War II soldier-turned-U.S. Marshal Teddy Daniels investigates the disappearance of a patient from a hospital for the criminally insane, but his efforts are compromised by troubling visions and a mysterious doctor.", poster: .shutterIsland, backDrop: .shutterIslandBackdrop)
    ]
    
    private var selectedMovie: MovieModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "goToMovieDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? MovieDetailViewController else {
            return
        }
        destVC.configure(with: selectedMovie)
    }
    
}
