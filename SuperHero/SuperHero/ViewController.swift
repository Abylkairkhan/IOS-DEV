import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroGender: UILabel!
    @IBOutlet weak var heroPower: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroWeight: UILabel!
    @IBOutlet weak var heroEyeColor: UILabel!
    @IBOutlet weak var heroHairColor: UILabel!
    @IBOutlet weak var heroRace: UILabel!
    @IBOutlet weak var heroBirth: UILabel!
    
    private var shimmerLayers: [CALayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startShimmerAnimation()
        fetchHero(by: 1)
    }

    @IBAction func getHeroClicked(_ sender: Any) {
        let randomId = Int.random(in: 1...731)
        startShimmerAnimation()
        print(randomId)
        fetchHero(by: randomId)
    }
    
    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in guard self.handleError(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
        
    }
    
    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(HeroModel.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)
            
            DispatchQueue.main.async {
                print(hero.name)
                self.stopShimmerAnimation()
                self.heroImage.image = heroImage
                self.heroName.text = "Name: " + hero.name
                self.heroGender.text = "Gender: " + hero.appearance.gender
                self.heroPower.text = "Power: \(hero.powerstats.power)"
                self.heroSpeed.text = "Speed: \(hero.powerstats.speed)"
                self.heroWeight.text = "Weight: " + (hero.appearance.weight.last ?? "Unknown")
                self.heroEyeColor.text = "Eye color: " + hero.appearance.eyeColor
                self.heroHairColor.text = "Hair color: " + hero.appearance.hairColor
                self.heroRace.text = "Race: " + (hero.appearance.race ?? "Unknown")
                self.heroBirth.text = "Birth: " + hero.biography.placeOfBirth
            }
        } catch {
            DispatchQueue.main.async {
                self.stopShimmerAnimation()
                self.heroName.text = error.localizedDescription
            }
        }
    }
    
    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleError(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        heroName.text = error.localizedDescription
        return true
    }
    
    private func clearHeroData() {
        heroImage.image = nil
        heroName.text = "   "
        heroGender.text = "   "
        heroPower.text = "   "
        heroSpeed.text = "   "
        heroWeight.text = "   "
        heroEyeColor.text = "   "
        heroHairColor.text = "   "
        heroRace.text = "   "
        heroBirth.text = "   "
    }
    
    // MARK: - Shimmer Animation
    private func startShimmerAnimation() {
        clearHeroData()
        
        let shimmerColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
            shimmerColor,
            UIColor.white.withAlphaComponent(0.2).cgColor,
            shimmerColor
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = heroImage.bounds
        
        // Add animation
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1, -0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "shimmerAnimation")
        
        // Add shimmer to all views
        addShimmer(to: heroImage, with: gradientLayer)
        addShimmer(to: heroName)
        addShimmer(to: heroGender)
        addShimmer(to: heroPower)
        addShimmer(to: heroSpeed)
        addShimmer(to: heroWeight)
        addShimmer(to: heroEyeColor)
        addShimmer(to: heroHairColor)
        addShimmer(to: heroRace)
        addShimmer(to: heroBirth)
    }
    
    private func stopShimmerAnimation() {
        shimmerLayers.forEach { $0.removeFromSuperlayer() }
        shimmerLayers.removeAll()
    }
    
    private func addShimmer(to view: UIView, with layer: CALayer? = nil) {
        let shimmerLayer = layer ?? {
            let layer = CAGradientLayer()
            layer.colors = [
                UIColor.lightGray.withAlphaComponent(0.4).cgColor,
                UIColor.white.withAlphaComponent(0.2).cgColor,
                UIColor.lightGray.withAlphaComponent(0.4).cgColor
            ]
            layer.locations = [0, 0.5, 1]
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint(x: 1, y: 0.5)
            return layer
        }()
        
        view.layoutIfNeeded()
        shimmerLayer.frame = view.bounds
        view.layer.addSublayer(shimmerLayer)
        shimmerLayers.append(shimmerLayer)
    }
}

