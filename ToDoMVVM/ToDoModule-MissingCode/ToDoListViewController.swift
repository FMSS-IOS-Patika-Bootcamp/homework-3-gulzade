//
//  ToDoListViewController.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import UIKit
import CoreData
class ToDoListViewController: UIViewController {

    @IBOutlet weak var tableviewToDo: UITableView!
    private let viewModelToDo = TodoListViewModel() //viewModel instance
    private var itemsToDo: [ToDoCellViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModelToDo.viewDelegate = self
        viewModelToDo.didViewLoad()
    }
    


}

private extension ToDoListViewController {
    func setupUI(){  // View'ı daha sadeleştirmek, basite indirgemek için fonk. içine taşıdık
        tableviewToDo.delegate = self
        tableviewToDo.dataSource = self
        registerCell()
    }
    
    func registerCell() {
        tableviewToDo.register(.init(nibName: "ToDoListCellViewModel", bundle: nil), forCellReuseIdentifier: "ToDoListCellViewModel")
    }
}

extension ToDoListViewController: ToDoListViewModelViewProtocol {

    
    func didCellItemFetch(_ items: [ToDoCellViewModel]) {
        self.itemsToDo = items
        tableviewToDo.reloadData()
    }
   
}


extension ToDoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelToDo.didClickItem(at: indexPath.row)
    }
    
}
extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToDo.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCellViewModel") as! ToDoListCellViewModel
        cell.toDoNameLabel.text = itemsToDo[indexPath.row].todoName
        cell.stateToDo = itemsToDo[indexPath.row].isCompleted!
        return cell
    }
    
    
    
}
