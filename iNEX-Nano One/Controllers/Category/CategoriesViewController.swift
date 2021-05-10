//
//  CategoriesViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
// Masih bingung buat pickernya nanti berubah gimana

import UIKit

//MARK: ngebuat protocol.
protocol receiveData: class {
    func passDataBack(data: [String], index: Int, isIncome: Bool)
}

class KategoriExpense {
    
    //cara akses variable di file lain = (nama kelas di file lain).(variable di file tersebut)
    
    var expensesArray = ExpenseCategory().expenses
    
    // berdasarkan contoh,ExpenseCategory itu kelas di file data source, expenses adalah variable array-nya
}

class CategoriesViewController: UITableViewController {
    //MARK: Properties
    let categoryTableList = ExpenseCategory()
    
    //MARK: Bagian protocol
    weak var delegate: receiveData?
    var kategoriExpense = KategoriExpense().expensesArray
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate?.passDataBack(data: kategoriExpense, index: selectedIndex, isIncome: false) // --> ngirim function protocol
        print("udah pass data back")
    }
    
}
    



//MARK: UITableView Data Source
extension CategoriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryTableList.numberOfExpenses()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryTableList.expenseName(at: indexPath)
        
        if indexPath.row == categoryTableList.selectedExpenseIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

//MARK: UITableView Delegate

extension CategoriesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedIndex = indexPath.row
        
        if let index = categoryTableList.selectedExpenseIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        categoryTableList.selectExpense(at: indexPath)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        delegate?.passDataBack(data: kategoriExpense, index: selectedIndex, isIncome: false) // ngirim protocol saat segue
        performSegue(withIdentifier: "unwindSegueToTrx", sender: cell)
        print("pass data back di table")
        
    }
}

