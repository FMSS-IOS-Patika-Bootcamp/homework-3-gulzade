//
//  PostListTableViewCell.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var postTitleLabel: UILabel!
    
    @IBOutlet private(set) weak var postDescLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8
    }
    
}
