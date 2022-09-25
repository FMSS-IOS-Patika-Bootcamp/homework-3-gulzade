//
//  PhotosViewController.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import UIKit
import Kingfisher
class PhotosListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let photosIdentifier = "PhotoListCollectionViewCell"
    private var viewModelPhoto = PhotoListViewModel()
    private var photoItems :[PhotoCellViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
        viewModelPhoto.viewDelegate = self
        viewModelPhoto.didViewLoad()
    }
    

   

}

private extension PhotosListViewController {
    func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top:7, left: 7, bottom: 7, right: 7)
        design.minimumLineSpacing = 3
        design.minimumInteritemSpacing = 3
        let width = UIScreen.main.bounds.width
        let widthCell = ( width - 26) / 4
        design.itemSize = CGSize(width: widthCell, height: widthCell)
        collectionView.collectionViewLayout = design
        registerCell()
    }
    func registerCell(){
        collectionView.register(.init(nibName: "PhotoListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photosIdentifier)
    }
}

extension PhotosListViewController: PhotolistViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [PhotoCellViewModel]) { //viewe haber verecek kendi delegesi ile
        self.photoItems = items
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()

        }
    }
   
}

extension PhotosListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModelPhoto.didClickItem(at: indexPath.row)
    }
}

extension PhotosListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosIdentifier, for:indexPath) as! PhotoListCollectionViewCell
        if let url = photoItems[indexPath.row].image{
            cell.photoImageView.kf.setImage(with: URL(string: url) )
            cell.setupView()
        }
     //   cell.photoImageView.image = kf.setImage(with: photoItems[indexPath.row].image)
        return cell
    }
    
    
}

