//
//  CategoriesIncomeTableViewCell.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 03/05/21.
//

import UIKit

protocol receiveDataIncome: class {
    func passDataBackIncome(data: [String], index: Int, isIncome: Bool)
}

class KategoriIncome {
    var incomeCategory = IncomeCategory().incomes
}

class CategoriesIncomeViewController: UITableViewController {
    //MARK: Properties
    let categoryIncomeTableList = IncomeCategory()
    
    weak var delegate: receiveDataIncome?
    var kategoriIncome = KategoriIncome().incomeCategory
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate?.passDataBackIncome(data: kategoriIncome, index: selectedIndex, isIncome: true)
    }
}

//MARK: UITableView Data Source
extension CategoriesIncomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryIncomeTableList.numberOfIncomes()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCellIncome", for: indexPath)
        
        cell.textLabel?.text = categoryIncomeTableList.incomeName(at: indexPath)
        
        if indexPath.row == categoryIncomeTableList.selectedIncomeIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

//MARK: UITableView Delegate

extension CategoriesIncomeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedIndex = indexPath.row
        
        if let index = categoryIncomeTableList.selectedIncomeIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        categoryIncomeTableList.selectIncome(at: indexPath)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        
        delegate?.passDataBackIncome(data: kategoriIncome, index: selectedIndex, isIncome: false)
        performSegue(withIdentifier: "unwindSegueToTrxIncome", sender: cell)
    }
}

