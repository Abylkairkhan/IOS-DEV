//
//  SecondViewController.swift
//  MyFavoritesWithDetails
//
//  Created by Abylkairkhan Sarsetayev on 02.11.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookOverview: UILabel!
    @IBOutlet weak var bookPageCount: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    private var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImage.image = book?.image
        bookName.text = book?.title
        bookOverview.text = book?.description
        bookAuthor.text = "Author: " + (book?.author ?? "")
        if let pageCount = book?.countOfPages {
            bookPageCount.text = "Pages Count: " + String(pageCount)
        } else {
            bookPageCount.text = "Pages Count: N/A"
        }
    }
    
    func configure(with book: Book?) {
        self.book = book
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
