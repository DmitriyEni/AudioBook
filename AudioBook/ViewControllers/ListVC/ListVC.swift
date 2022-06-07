//
//  ListVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var book = ["Бытье", "Давид", "Псалтырь", "Исход", "Матфея", "Иисуса Навина", "Марка", "Иоана", "Откровенье"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
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
        return book.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath)
        guard let listCell = cell as? ListCell else { return cell }
        return listCell
    }
}

extension ListVC: UITableViewDelegate {
    
}
