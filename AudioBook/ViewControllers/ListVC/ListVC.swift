//
//  ListVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit
import Haptica
import ID3TagEditor

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var books = [Book]()
    let id3TagEditor = ID3TagEditor()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBook()
        setupTable()
    }
    
    private func configureBook() {
        books.append(Book(tackName: "01_01"))
        books.append(Book(tackName: "01_02"))
        books.append(Book(tackName: "01_03"))
        books.append(Book(tackName: "01_04"))
        books.append(Book(tackName: "1_01"))
        books.append(Book(tackName: "1_02"))
        books.append(Book(tackName: "1_03"))
        books.append(Book(tackName: "1_04"))
        books.append(Book(tackName: "1_05"))
        books.append(Book(tackName: "1_06"))
        books.append(Book(tackName: "1_07"))
        books.append(Book(tackName: "2_01"))
        books.append(Book(tackName: "2_02"))
        books.append(Book(tackName: "2_03"))
        books.append(Book(tackName: "2_04"))
        books.append(Book(tackName: "2_05"))
        books.append(Book(tackName: "2_06"))
        books.append(Book(tackName: "2_07"))
        
//
//        for i in 0..<books.count {
//            var book = books[i]
//
//            let urlString = Bundle.main.path(forResource: book.tackName, ofType: "mp3")
//            guard let urlString = urlString else { return }
//            if let id3Tag = try? id3TagEditor.read(from: urlString ) {
//                let tagContentReader = ID3TagContentReader(id3Tag: id3Tag)
//                print("album: \(tagContentReader.album() ?? "")")
//                print("title: \(tagContentReader.title() ?? "")")
//                print("albumArtist: \(tagContentReader.albumArtist() ?? "")")
//                book.albomName = tagContentReader.album() ?? ""
//                book.name = tagContentReader.title() ?? ""
//                book.artistName = tagContentReader.albumArtist() ?? ""
//                let imagedata = tagContentReader.attachedPictures()
//                if imagedata.count == 0 {
//                    book.imageCover = UIImage(named: "testCover")!
//                } else {
//                book.imageCover = UIImage(data: imagedata[0].picture)!
//                }
//            }
//        }
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: String(describing: ListCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: ListCell.self))
    }
    @IBAction func addBookAction(_ sender: Any) {
        
    }
}

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath)
        guard let listCell = cell as? ListCell else { return cell }
        
        let book = books[indexPath.row]
        listCell.accessoryType = .disclosureIndicator
//        listCell.book = books
//        listCell.position = indexPath.row
        listCell.setupCell(position: indexPath.row, book: book)
//        listCell.createCell(imageCover: book.imageCover, Name: book.albomName)
       
        return listCell
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Haptic.impact(.soft).generate()
        let position = indexPath.row
    
        let playerVC = PlayerVC(nibName: String(describing: PlayerVC.self), bundle: nil)
        playerVC.book = books
        playerVC.position = position
        playerVC.modalPresentationStyle = .fullScreen
        present(playerVC, animated: true)
    }
}
