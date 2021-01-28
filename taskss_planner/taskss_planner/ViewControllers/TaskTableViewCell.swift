//
//  TaskTableViewCell.swift
//  taskss_planner
//
//  Created by Youssef Taleb on 28/01/2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var task_name: UILabel!
    @IBOutlet weak var importance: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
