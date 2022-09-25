//
//  ToDoCellViewModel.swift
//  ToDoMVVM
//
//  Created by Gülzade Karataş on 25.09.2022.
//

import UIKit

class ToDoListCellViewModel: UITableViewCell {
    @IBOutlet weak var toDoNameLabel: UILabel!
    
    @IBOutlet weak var stateToDoSwitch: UISwitch!
    
    var todo: ToDo? {
        didSet {
            if let todo = todo {
                if todo.isCompleted == false {
                    toDoNameLabel.text = todo.toDoName
            }else {
                toDoNameLabel.attributedText = todo.toDoName?.strikeThrough()
               
                }
            }
        }
    }
    override func prepareForReuse() {
        toDoNameLabel.attributedText = toDoNameLabel.text?.removeAttributedText()
        toDoNameLabel.text = ""

        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}
