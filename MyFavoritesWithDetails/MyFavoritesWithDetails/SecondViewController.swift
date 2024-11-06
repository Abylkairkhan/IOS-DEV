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
    
    private var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImage.image = book?.image
        bookName.text = book?.title
        bookOverview.text = book?.description
    }
    
    func configure(with book: Book?) {
        self.book = book
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
