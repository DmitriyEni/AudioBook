//
//  ListCell.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit
import ID3TagEditor

class ListCell: UITableViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var mumberOfChapters: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    public var position = 0
    public var book: [Book] = []
    let id3TagEditor = ID3TagEditor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(position: Int, book: Book) {
        
        let urlString = Bundle.main.path(forResource: book.tackName, ofType: "mp3")
        
        guard let urlString = urlString else { return }
        
        guard let id3Tag = try? id3TagEditor.read(from: urlString ) else { return }
        let tagContentReader = ID3TagContentReader(id3Tag: id3Tag)
        var imageCoverr = UIImage(named: "testCover")
        let imagedata = tagContentReader.attachedPictures()
        if imagedata.count == 0 {
            imageCoverr = UIImage(named: "testCover")!
        } else {
            imageCoverr = UIImage(data: imagedata[0].picture)!
        }
        bookName.text = tagContentReader.album() ?? ""
        coverImage.image = imageCoverr
    }
}
