//
//  BookDetailViewController.swift
//  TabBarApp
//
//  Created by Abylkairkhan Sarsetayev on 13.11.2024.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private var book: BookModel?

    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookPageCount: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookDimension: UILabel!
    @IBOutlet weak var bookOverview: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImage.image = book?.poster
        bookName.text = book?.title
        bookAuthor.text = book?.author
        if let bookYearTemp = book?.year {
            bookYear.text = "Year: " + String(bookYearTemp)
        } else {
            bookYear.text = "Year: null"
        }
        if let bookPageTemp = book?.pageCount {
            bookPageCount.text = "Page count: " + String(bookPageTemp)
        } else {
            bookPageCount.text = "Page count: null"
        }
        bookDimension.text = book?.dimensions
        bookOverview.text = "Dimension: " + (book?.overview ?? "null")
    }

    func configure(with book: BookModel?) {
        self.book = book
    }

}
