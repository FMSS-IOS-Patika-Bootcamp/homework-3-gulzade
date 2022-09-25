//
//  ToDoCellViewModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import UIKit

class ToDoListCellViewModel: UITableViewCell {
    @IBOutlet weak var toDoNameLabel: UILabel!
    
    @IBOutlet weak var toDoStateButton: UIButton!
    var stateToDo:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toDoStateButton.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func isCompletedButton(_ sender: Any) {
        
    }
}
