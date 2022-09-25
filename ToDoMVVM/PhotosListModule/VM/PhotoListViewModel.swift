//
//  PhotoListViewModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation


protocol PhotolistViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PhotoCellViewModel]) //view'a haber vermek için

}

class PhotoListViewModel {
    private let modelPhoto = PhotoListModel()
    
    weak var viewDelegate: PhotolistViewModelViewProtocol? // delegate işlemleri çekmek için
    
    init() {
        modelPhoto.delegate = self // modeldan haber almaya başlamak için
    }
    func didViewLoad(){
        modelPhoto.fetchData() //  viewcontroller didload oldugunda yani ekranda gözüktüğünde viewModela haber verecek, viewModelda gitcek dataları çekecek
        
    }
    func didClickItem(at index: Int){ // basılan index
        let selectedItem = modelPhoto.photos[index]
    }
    
}
private extension PhotoListViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ photos: [Photo]) -> [PhotoCellViewModel] { //gelen dataya göre viewbase model yapacak
        return photos.map{(.init(title: $0.title, image: $0.url))}
    }
}

// MARK: - PhotoListModelProtocol
extension PhotoListViewModel: PhotoListModelProtocol {
   
    func didDataFetchProcessFinish(_ isSuccess: Bool) {  /*Api'den gelen data burada. ViewModel, Modeldan gelen datayı transform edicek */
        
        if isSuccess {
            let photos = modelPhoto.photos
            let cellModels = makeViewBasedModel(photos)
            viewDelegate?.didCellItemFetch(cellModels)
            
        } else{
           
        }
       
       
    }
}
