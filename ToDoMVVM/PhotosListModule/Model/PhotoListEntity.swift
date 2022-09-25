//
//  PhotoListEntity.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation
import UIKit

struct PhotoCellViewModel {
    var title: String?
    var image: String?
}

struct Photo: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
