//
//  ListCell.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var mumberOfChapters: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func createCell(Cover: String, Name: String) {
        bookName.text = Name
        coverImage.image = UIImage(named: Cover)
        
        
    }
}
