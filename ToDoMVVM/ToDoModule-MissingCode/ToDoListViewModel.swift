//
//  ToDoListViewModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation

protocol ToDoListViewModelViewProtocol: AnyObject{ //Viewın protokolü
    func didCellItemFetch(_ items: [ToDoCellViewModel]) //view'a haber vermek için

    
}

class TodoListViewModel {
    
    // View'a haber vermek için view'ın instance'ına ihtiyaç var. Bunu burada delegate ile yapıyoruz.
    
    private let modelToDo = ToDoListModel() //ViewModel modelı kendi içinte tutmak zorunda. Modelın intance'ına sahip olacak
    
    weak var viewDelegate: ToDoListViewModelViewProtocol? // delegate işlemleri çekmek için
    
   
    init() {
        modelToDo.delegate = self // modeldan haber almaya başlamak için
    }
    func didViewLoad(){
  
}
private extension TodoListViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ toDos: [ToDo]) -> [ToDoCellViewModel] { //gelen dataya göre viewbase model yapacak
        return toDos.map {.init(todoName: $0.toDoName, isCompleted: $0.isCompleted)}
    }
}

// MARK: - ToDoListModelProtocol
extension TodoListViewModel: ToDoListModelProtocol {
   
    func didDataFetchProcessFinish2(_ isSuccess: Bool) {  /*Api'den gelen data burada. ViewModel, Modeldan gelen datayı transform edicek */
        
        
       
    }
}
