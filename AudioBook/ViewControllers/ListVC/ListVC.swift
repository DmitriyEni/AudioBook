//
//  ListVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBook()
        setupTable()
    }
    
    private func configureBook() {
        books.append(Book(name: "Глава 1",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_01"))
        books.append(Book(name: "Глава 2",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_02"))
        books.append(Book(name: "Глава 3",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_03"))
        books.append(Book(name: "Глава 4",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_04"))
        books.append(Book(name: "Глава 5",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_05"))
        books.append(Book(name: "Глава 6",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_06"))
        books.append(Book(name: "Глава 7",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_07"))
        books.append(Book(name: "Глава 8",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_08"))
        books.append(Book(name: "Глава 9",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_09"))
        books.append(Book(name: "Глава 10",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_10"))
        books.append(Book(name: "Глава 11",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_11"))
        books.append(Book(name: "Глава 12",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_12"))
        books.append(Book(name: "Глава 13",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_13"))
        books.append(Book(name: "Глава 14",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_14"))
        books.append(Book(name: "Глава 15",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_15"))
        books.append(Book(name: "Глава 16",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_16"))
        books.append(Book(name: "Глава 17",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_17"))
        books.append(Book(name: "Глава 18",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_18"))
        books.append(Book(name: "Глава 19",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_19"))
        books.append(Book(name: "Глава 20",
                          albomName: "КлаТбище домашних жЫвотных",
                          artistName: "Всеволод Кузнецов",
                          imageName: "testCover",
                          tackName: "01_20"))
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: String(describing: ListCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: ListCell.self))
    }
}

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath)
        guard let listCell = cell as? ListCell else { return cell }
        
//        configurate
        
        return listCell
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        present
        let position = indexPath.row
        
        let playerVC = PlayerVC(nibName: String(describing: PlayerVC.self), bundle: nil)
        
//        navigationController?.pushViewController(playerVC, animated: true)
    }
}
