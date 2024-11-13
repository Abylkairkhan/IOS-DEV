import UIKit

class MusicDetailViewController: UIViewController {

    @IBOutlet weak var musicPoster: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicAuthor: UILabel!
    @IBOutlet weak var musicListensCount: UILabel!
    @IBOutlet weak var musicDuration: UILabel!
    
    private var music: MusicModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicPoster.image = music?.poster
        musicName.text = music?.name
        musicAuthor.text = music?.author
        musicListensCount.text = "Listeners: " + (music?.listenedCount ?? "null")
        musicDuration.text = "Duration: " + (music?.duration ?? "null")
    }
    
    func configure(with music: MusicModel?) {
        self.music = music
    }

}
