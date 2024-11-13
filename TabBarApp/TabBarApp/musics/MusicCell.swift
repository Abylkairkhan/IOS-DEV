import UIKit

class MusicCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with music: MusicModel?) {
        musicImage.image = music?.poster
        musicName.text = music?.name
        musicAuthor.text = music?.author
    }

}
