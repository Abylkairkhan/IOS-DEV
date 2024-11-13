import UIKit

class MusicViewController: UITableViewController {

    @IBOutlet var musicTableView: UITableView!
    
    private var musics: [MusicModel] = [
        MusicModel(poster: .murashkami, name: "Мурашками", author: "MOT", listenedCount: "7 831 000", duration: "3:19"),
        MusicModel(poster: .kapkan , name: "Капкан", author: "MOT", listenedCount: "24 000 000", duration: "3:48"),
        MusicModel(poster: ._4AmLondon, name: "4 am in London", author: "T-Fest", listenedCount: "345 000", duration: "3:00"),
        MusicModel(poster: .newCoast , name: "Союз", author: "Whole Lotta Swag", listenedCount: "301 000", duration: "2:15"),
        MusicModel(poster: .murashkami, name: "Мурашками", author: "MOT", listenedCount: "7 831 000", duration: "3:19"),
        MusicModel(poster: .kapkan , name: "Капкан", author: "MOT", listenedCount: "24 000 000", duration: "3:48"),
        MusicModel(poster: ._4AmLondon, name: "4 am in London", author: "T-Fest", listenedCount: "345 000", duration: "3:00"),
        MusicModel(poster: .newCoast , name: "Союз", author: "Whole Lotta Swag", listenedCount: "301 000", duration: "2:15"),
        MusicModel(poster: .murashkami, name: "Мурашками", author: "MOT", listenedCount: "7 831 000", duration: "3:19"),
        MusicModel(poster: .kapkan , name: "Капкан", author: "MOT", listenedCount: "24 000 000", duration: "3:48"),
        MusicModel(poster: ._4AmLondon, name: "4 am in London", author: "T-Fest", listenedCount: "345 000", duration: "3:00"),
        MusicModel(poster: .newCoast , name: "Союз", author: "Whole Lotta Swag", listenedCount: "301 000", duration: "2:15")
    ]
    
    private var selectedMusic: MusicModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        let music = musics[indexPath.row]
        cell.configure(with: music)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMusic = musics[indexPath.row]
        performSegue(withIdentifier: "goToMusicDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? MusicDetailViewController else {
            return
        }
        destVC.configure(with: selectedMusic)
    }

}
