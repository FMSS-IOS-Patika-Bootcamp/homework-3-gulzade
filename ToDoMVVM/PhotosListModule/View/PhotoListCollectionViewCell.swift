//
//  PhotoListCollectionViewCell.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import UIKit

class PhotoListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
       /* containerView.layer.borderColor = UIColor.systemGray6.cgColor
        containerView.layer.borderWidth = 1.5
        containerView.layer.cornerRadius = CGFloat(roundf(Float(self.containerView.frame.size.width / 2.0)))*/
    }
    func setupView(){
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.borderColor = UIColor.systemGray4.cgColor
        photoImageView.layer.borderWidth = 1.0
        photoImageView.layer.cornerRadius = CGFloat(roundf(Float(self.photoImageView.frame.size.width / 2.0)))
        photoImageView.layer.backgroundColor = UIColor.white.cgColor
    }
}
