//
//  ListVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit
import Haptica
import UniformTypeIdentifiers
import ID3TagEditor

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var books = [Book]()
    let id3TagEditor = ID3TagEditor()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBook()
        setupTable()
        self.tableView.reloadData()
    }
    
    private func configureBook() {
        
//
//        guard let id3Tag = try? id3TagEditor.read(from: urlString) else { return }
//            // ...use the tag...
//            // For example to read the title, album and artist content you can do something similar
//            var title: String = (id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? ""
//            print((id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? "")
//            print((id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content ?? "")
//            print((id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "")
//            print("trtrjfjnef \(title)")
        
        
        
//
//
//
//

        books.append(Book(name: "Глава 1",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_01", pathcs: URL(fileURLWithPath: "01")))
        
    }
//        books.append(Book(name: "Глава 2",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_02"))
//        books.append(Book(name: "Глава 3",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_03"))
//        books.append(Book(name: "Глава 4",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_04"))
//        books.append(Book(name: "Глава 5",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_05"))
//        books.append(Book(name: "Глава 6",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_06"))
//        books.append(Book(name: "Глава 7",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_07"))
//        books.append(Book(name: "Глава 8",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_08"))
//        books.append(Book(name: "Глава 9",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_09"))
//        books.append(Book(name: "Глава 10",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_10"))
//        books.append(Book(name: "Глава 11",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_11"))
//        books.append(Book(name: "Глава 12",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_12"))
//        books.append(Book(name: "Глава 13",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_13"))
//        books.append(Book(name: "Глава 14",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_14"))
//        books.append(Book(name: "Глава 15",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_15"))
//        books.append(Book(name: "Глава 16",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_16"))
//        books.append(Book(name: "Глава 17",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_17"))
//        books.append(Book(name: "Глава 18",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_18"))
//        books.append(Book(name: "Глава 19",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_19"))
//        books.append(Book(name: "Глава 20",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "01_20"))
//        books.append(Book(name: "Глава 20",
//                          albomName: "КлаТбище домашних жЫвотных",
//                          artistName: "Всеволод Кузнецов",
//                          imageName: "testCover",
//                          tackName: "05"))
//    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: String(describing: ListCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: ListCell.self))
    }
    @IBAction func addBookAction(_ sender: Any) {
        let documetPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.audio], asCopy: true)
        documetPicker.delegate = self
        present(documetPicker, animated: true, completion: nil )
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
        listCell.createCell(Cover: book.imageName, Name: book.name)
        
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

extension ListVC: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let selectedFileURL = urls.first,
              let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return }
        
        let sendboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sendboxFileURL.path) {
            print("Already exist")
        }
        else {
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sendboxFileURL)
                print("Completed")
                self.books.append(Book(name: "", albomName: "", artistName: "", imageName: "", tackName: "", pathcs: sendboxFileURL))
                print(sendboxFileURL)
                self.tableView.reloadData()
            }
            catch {
                print("error")
            }
        }
    }
}

