//
//  HomeContentTableViewCell.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 04/05/21.
//

import UIKit

class HomeContentTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolType: UIImageView!
    @IBOutlet weak var financeType: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Properties
    var financeFill: FinancesList? {
        didSet {
            guard let financeCell = financeFill else { return }
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            
            financeType.text = financeCell.type
            dateLabel.text = formatter.string(from: financeCell.date as! Date)
            costLabel.text = String(financeCell.cost ?? 0)
            symbolType.image = UIImage(named: financeCell.symbol ?? "positive")
        }
    }
    

}
