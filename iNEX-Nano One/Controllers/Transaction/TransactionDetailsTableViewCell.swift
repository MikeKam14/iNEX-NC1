//
//  TransactionDetailsTableViewCell.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
//

import UIKit

class TransactionDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detailsValueLabel: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
