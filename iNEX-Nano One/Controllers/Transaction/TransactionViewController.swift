//
//  TransactionViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
//

import UIKit

let dateToday = Date()
let dateFormatter = DateFormatter()

class TransactionViewController: UIViewController, UITextFieldDelegate {

    
    //MARK: Outlets
    @IBOutlet weak var incomeExpensePicker: UISegmentedControl!
    
    @IBOutlet weak var moneyInPicker: UITextField! {
        didSet {
            moneyInPicker.becomeFirstResponder()
            moneyInPicker.delegate = self
        }
    }
    
    @IBOutlet weak var detailsTableViewTrx: UITableView!
    
    //MARK: Constants
    
    //MARK: Variables
    
    var financesFill: FinancesList?
    
    var arrayOfImage: [UIImage?] = [UIImage(systemName: "calendar.badge.clock"), UIImage(systemName: "circle.grid.3x3"), UIImage(systemName: "doc.text")]
    
    var detailsTable: [String] = []
    var detailsImage: [UIImageView] = []
    var rightDetailsValue: [String] = []
    var rightDetailsValueExpense: [String] = []
    
    var textKananTableTrx = "(Select)" //perlu didset biar bisa berubah valuenya, masalahnya labelnya ada di cell, bukan di uitableviewcontroller.
    
    var textKananTanggal = ""
    
    
    //MARK: Variables for passing table view cell to home controller
    var moneyAmount = 0
    var type = ""
    var img = ""
    var date = NSDate()
    
    
    //MARK: LOADING VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        detailsTable = ["Date", "Category", "Notes"]
        rightDetailsValue = [dateFormatter.string(from: date as Date), textKananTableTrx, ""]
        rightDetailsValueExpense = [dateFormatter.string(from: date as Date), textKananTableTrx, ""]
        
        //MARK: Configure the Table View (ini buat keluarin data)
        detailsTableViewTrx.delegate = self
        detailsTableViewTrx.dataSource = self
        detailsTableViewTrx.estimatedRowHeight = 60
        detailsTableViewTrx.rowHeight = UITableView.automaticDimension
        
        detailsTableViewTrx.layer.cornerRadius = 10
        
        //initializeHideKeyboard()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToCategory",
           let categoryPickerViewController = segue.destination as? CategoriesViewController {
            categoryPickerViewController.categoryTableList.selectedExpense = textKananTableTrx //(isi string buat checkmark muncul di list)
            categoryPickerViewController.delegate = self
        } else if segue.identifier == "segueToCategoryIncome",
            let categoryIncomePickerViewController = segue.destination as? CategoriesIncomeViewController {
             categoryIncomePickerViewController.categoryIncomeTableList.selectedIncome = textKananTableTrx
            categoryIncomePickerViewController.delegate = self
        }
        
        if segue.identifier == "saveTrxToHome" {
            let destVC = segue.destination as? HomeViewController
            switch incomeExpensePicker.selectedSegmentIndex {
                case 0:
                    moneyAmount = Int(moneyInPicker?.text ?? "0")!
                    type = "Income"
                    img = "positive"
                    date = NSDate()
                case 1:
                    moneyAmount = Int(moneyInPicker?.text ?? "0")!
                    type = "Expense"
                    img = "negative"
                    date = NSDate()
                default:
                    break
            }
            if moneyInPicker.text == nil {
                let alertController = UIAlertController(title: "Money is empty", message: "Please fill money amount", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
            destVC?.newFinanceList = FinancesList(symbol: img, type: type, date: date, cost: moneyAmount)
        }
    }
    
    
    @IBAction func onChangeSegmented(_ sender: Any) {
        detailsTableViewTrx.reloadData()  //ini biar kalau dipencet segmentednya, tablenya langsung berubah view
    }
}

//MARK: Extension Protocol untuk nerima data

extension TransactionViewController: receiveData, receiveDataIncome {
    
    // ini function untuk nerima protocol dari categoriesview dan categoriesincome
    
    func passDataBackIncome(data: [String], index: Int, isIncome: Bool) {
        if isIncome {
        rightDetailsValue[1] = data[index]
        
        print("masuk pass data back income")
        detailsTableViewTrx.reloadData()
        print(rightDetailsValue[1])
        }
    }
    
    func passDataBack(data: [String], index: Int, isIncome: Bool) {
        if !isIncome {
        rightDetailsValueExpense[1] = data[index]
        
        print("masuk pass data back expense")
        detailsTableViewTrx.reloadData()
        print(rightDetailsValue[1])
        }
    }

}


//MARK: Extension TableView

extension TransactionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch incomeExpensePicker.selectedSegmentIndex {
        case 0:
            return detailsTable.count
        case 1:
            return detailsTable.count
        default:
            break
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionDetailsCell", for: indexPath) as! TransactionDetailsTableViewCell

        switch incomeExpensePicker.selectedSegmentIndex {
        case 0:
            cell.detailsLabel.text = detailsTable[indexPath.row]
            cell.detailsImage.image = arrayOfImage[indexPath.row]
            cell.detailsValueLabel.text = rightDetailsValue[indexPath.row]
            print(rightDetailsValue[1])
        
         //   return cell//masih salah bung. Update 19.45, udh bener, harus di delegate datasource blabla di viewdidload
        
        case 1:
        //    let cell = tableView.dequeueReusableCell(withIdentifier: "transactionDetailsCell", for: indexPath) as! TransactionDetailsTableViewCell
        
            cell.detailsLabel.text = detailsTable[indexPath.row]
            cell.detailsImage.image = arrayOfImage[indexPath.row]
            cell.detailsValueLabel.text = rightDetailsValueExpense[indexPath.row]
            print(rightDetailsValue[1])
        
        //    return cell//masih salah bung. Update 19.45, udh bener, harus di delegate datasource blabla di viewdidload
        
        default:
            break
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch incomeExpensePicker.selectedSegmentIndex {
        case 0:
            if indexPath.row == 0 {
                
            } else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "segueToCategoryIncome", sender: self)
            } else if indexPath.row == 2 {
                self.performSegue(withIdentifier: "segueToNotesIncome", sender: self)
            }
        case 1:
            if indexPath.row == 0 {
                
            } else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "segueToCategory", sender: self)
            } else if indexPath.row == 2 {
                self.performSegue(withIdentifier: "segueToNotes", sender: self)
            }
            
        default:
            break
        }
        
    }
    
}

//MARK: Saving Data from Button (Unwind Segues to Home)
extension TransactionViewController {
    @IBAction func unwindSegueToTransactionViewController(_ segue: UIStoryboardSegue) {
        if let categoryPickerViewController = segue.source as? CategoriesViewController, let selectedCategory = categoryPickerViewController.categoryTableList.selectedExpense {
            textKananTableTrx = selectedCategory
        }
    }
    
    @IBAction func unwindSegueToTransactionViewControllerIncome(_ segue: UIStoryboardSegue) {
        if let categoryIncomePickerViewController = segue.source as? CategoriesIncomeViewController, let selectedCategoryIncome = categoryIncomePickerViewController.categoryIncomeTableList.selectedIncome {
            textKananTableTrx = selectedCategoryIncome
        }
    }
    
    @IBAction func unwindFromNotestoTrx(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindFromNotesToTrxIncome (_ segue: UIStoryboardSegue) {
        
    }
}

extension TransactionViewController {
    func initializeHideKeyboard() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
}
