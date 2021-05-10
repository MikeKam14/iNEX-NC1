//
//  FinanceListArray.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 04/05/21.
//

import UIKit

class FinanceDataSource: NSObject, UITableViewDelegate {
    
    var financeData: [FinancesList]
    
    static func generateFinanceData() -> [FinancesList] {
        return [
            FinancesList(symbol: "positive", type: "Income", date: NSDate(), cost: 0)
        ]
    }
    
    
    
    //MARK: - INITIALIZERS
    
    override init() {
        financeData = FinanceDataSource.generateFinanceData()
    }
    
    
    //MARK: DATASOURCE METHODS
    
    func numberOfFinances() -> Int {
        financeData.count
    }
    
    func append(finance: FinancesList, to tableView: UITableView) {
        financeData.append(finance)
        tableView.insertRows(at: [IndexPath(row: financeData.count-1, section: 0)], with: .automatic)
    }
    
    func finance(at indexPath: IndexPath) -> FinancesList {
        financeData[indexPath.row]
    }
}
