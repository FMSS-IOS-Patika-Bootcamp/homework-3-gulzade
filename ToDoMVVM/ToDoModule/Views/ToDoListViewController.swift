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
    let viewModelToDo = TodoListViewModel() //viewModel instance
   
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModelToDo.refreshData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableviewToDo.reloadData()
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



extension ToDoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = viewModelToDo.todoAtIndex(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        if todo.isCompleted == false {
            let alertController = UIAlertController(title: "Completed?", message: "Mark this task as completed?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
                self.viewModelToDo.completeTaskAtIndex(indexPath.row) { (_) in
                    tableView.reloadData()
                }
            }))
            alertController.addAction(UIAlertAction(title: "NO", style: .destructive, handler: nil))
            present(alertController, animated: true)
        }
    }
    
}
extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelToDo.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCellViewModel") as! ToDoListCellViewModel
       
        
        return cell
    }
    
    
    
}
