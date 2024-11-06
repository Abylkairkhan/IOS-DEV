//
//  ViewController.swift
//  MyFavoritesWithDetails
//
//  Created by Abylkairkhan Sarsetayev on 02.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var books: [Book] = [
        Book(
            image: .oyanQazaq,
            title: "Оян, қазақ",
            description: "Міржақып Дулатұлы «Оян, қазақ!» деген ұранмен қазақ қоғамының ұлттық рухын оятқан ұлт зиялысы. Аз ғұмырын халқының білім алуына, тәуелсіз, еркін, азат болуына сарп етті. Олар ұлт үшін ештеңеден аянған жоқ. Ең бастысы, бір ұлтың тағдырын мойынына артып, Ұлы мақсат жолында жан аямады. Міржақып қазақ әдебиетінде ең бірінші болып көркем проза жанрында роман жазып шыққан автор. «Қазақ» газетіне жазған ұлт-азаттық идеялары ұйықтап жатқан халық жүрегін оятушы күшке айналды. Автордың «Оян, Қазақ!» еңбегінен бөлек балаларды оқу-жазуға үйретуге арнап жазған «Есеп құралы», «Қирағат кітабы», «Балқия» атты пьесасы сақталған. Әр қазақтың көкейінде «шырақ» болып жанған Міржақып мұрасын оқу – бүгінгі ұрпақтың басты міндеті.",
            countOfPages: 1436168
        ),
        Book(
            image: .beskorystie,
            title: "Бескорыстие",
            description: "Можно еще много написать о Мещерском крае, богатом лесами, торфом, сеном, картофелем, молоком и ягодами. Но неужели мы должны любить свою землю только за её богатства?",
            countOfPages: 100
        ),
        Book(
            image: .erTostik,
            title: "Ер Тостик",
            description: "Ер Тостик (или Ер-Тостык) — это эпическая поэма (дастан) казахского народа, которая входит в цикл казахских эпических произведений. Она является одним из наиболее известных и значимых эпосов в казахской литературе. Рассказ повествует о подвигах героя по имени Ер Тостик.",
            countOfPages: 222
        ),
        Book(
            image: .irtysh,
            title: "Иртыш",
            description: "Это произведение посвящено реке Иртыш и представляет собой глубокую лирическую медитацию на тему природы, памяти и личных переживаний автора. Стихотворение описывает природу вокруг реки, её течение, волны и обитателей, создавая живописную картину природного мира. Река становится центральным образом, символизируя широту и мощь родной земли. Автор выражает ностальгию и воспоминания о прошлом, о встречах и разлуках, о любви и печали. Эти воспоминания переплетаются с образами природы, создавая ощущение глубокого личного переживания. Упоминание о пароходах, товарах и станицах добавляет элемент человеческой жизни, связанной с рекой, делая её символом не только природной силы, но и жизненного пути.",
            countOfPages: 556
        ),
        Book(
            image: .kyzylZhebe,
            title: "Қызыл жебе",
            description: "«Қызыл жебе» – ірі қоғам қайраткері Тұрар Рысқұловтың өмірін, туған ортасы мен ел үшін істеген қызметін танытатын кең тынысты шығарма. Роман Тұрардың балалық шағы мен өскен ортасын, тегін, Сібірге айдалып бара жатқан әкесі Рысқұлдың өмірін, әке кегін баяндаудан басталады. Шығармаға өзек болған сюжеттер Тұрардың өсу, қалыптасу, кемелдену кезеңін көрсетіп, қиын өмірдегі күрделі тартыстардың бел ортасында жүрген Тұрардың бейнесін асқақтата түседі. Шығарманың өн бойында кездесетін кейіпкерлердің қай-қайсысының да өзіндік ерекшелігі, мақсат-мүддесі айқын суреттеліп, жазықсыз жапа шеккен жандардың өзара ыстық ықыласы мен достығы әсерлі де нанымды бейнеленеді. Шерхан Мұртазаның халқына өлшеусіз еңбек сіңірген Тұрар Рысқұловты «тірілткен» «Қызыл жебе» роман-эпопеясы ұлттың рухын көтерген бірден бір шығарма.",
            countOfPages: 777
        )
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    private var selectedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondViewController else {
            return
        }
        destVC.configure(with: selectedBook)

    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "goToBookDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        cell.configure(book)
        return cell
    }
    
}
