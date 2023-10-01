//
//  itemsTableViewCell.swift
//  FetchApp
//
//  Created by yajurva shrotriya on 9/30/23.
//

import UIKit

class itemsTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var listIDLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(id: Int!, listid: Int!, name: String?){
        
        idLabel.text = String(id)
        listIDLabel.text = String(listid)
        nameLabel.text = name
        
        
    }
    
}
