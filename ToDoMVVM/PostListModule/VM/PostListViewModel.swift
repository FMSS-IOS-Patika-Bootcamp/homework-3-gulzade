//
//  PostListviewModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation




protocol PostListViewModelViewProtocol: AnyObject{ //Viewın protokolü
    func didCellItemFetch(_ items: [PostCellViewModel]) //view'a haber vermek için

    
}
class PostListViewModel {
    // View'a haber vermek için view'ın instance'ına ihtiyaç var. Bunu burada delegate ile yapıyoruz.
    
    private let model = PostListModel() //ViewModel modelı kendi içinte tutmak zorunda. Modelın intance'ına sahip olacak
    
    weak var viewDelegate: PostListViewModelViewProtocol? // delegate işlemleri çekmek için
    
   
    init() {
        model.delegate = self // modeldan haber almaya başlamak için
    }
    func didViewLoad(){
       model.fetchData() //  viewcontroller didload oldugunda yani ekranda gözüktüğünde viewModela haber verecek, viewModelda gitcek dataları çekecek
        
    }
    
    func didClickItem(at index: Int){ // basılan index
        let selectedItem = model.posts[index]
    }
}

private extension PostListViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] { //gelen dataya göre viewbase model yapacak
        return posts.map {.init(title: $0.title, desc: $0.body)}
    }
}

// MARK: - PostListModelProtocol
extension PostListViewModel: PostListModelProtocol {
   
    func didDataFetchProcessFinish(_ isSuccess: Bool) {  /*Api'den gelen data burada. ViewModel, Modeldan gelen datayı transform edicek */
        
        if isSuccess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            
        } else{
            
        }
       
       
    }
}
