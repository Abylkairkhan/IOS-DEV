//
//  BookCell.swift
//  MyFavoritesWithDetails
//
//  Created by Abylkairkhan Sarsetayev on 02.11.2024.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ book: Book) {
        bookImage.image = book.image
        bookName.text = book.title
        
    }
    
}
