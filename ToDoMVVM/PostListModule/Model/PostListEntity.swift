//
//  PostListEntity.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation

struct PostCellViewModel { // Post cellinin viewının modeli
    
    var title: String?
    var desc: String?
}

struct Post: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
