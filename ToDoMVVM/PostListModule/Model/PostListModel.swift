//
//  PostListModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import Foundation

// Protocol amacı: Model kendine gelen datayı view modela aktarmaya çalışıcak

protocol PostListModelProtocol: AnyObject{
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class PostListModel {
    weak var delegate: PostListModelProtocol?   //Protocol delegate
    
    var posts: [Post] = []
    
    func fetchData(){ // Datalar çekeliyor
       guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else {
           delegate?.didDataFetchProcessFinish(false)
            return
        }
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
       

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {  return }
            
            guard  error == nil
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }

            let statusCode = (response as! HTTPURLResponse).statusCode
            guard
                statusCode >= 200, statusCode < 300
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            guard let data = data else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder() //data decode ediliyor
                self.posts = try jsonDecoder.decode([Post].self, from: data) // Post tipinde
                self.delegate?.didDataFetchProcessFinish(true)
            } catch {
                self.delegate?.didDataFetchProcessFinish(false)
                print("JSON Serilization error")
            }
        }
        task.resume()
        
    }
}
