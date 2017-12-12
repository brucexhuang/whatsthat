//
//  TableCellTableViewCell.swift
//  What's that
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelTextViewLoad: UILabel!
    
    @IBOutlet weak var labelTextViewLoad2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
