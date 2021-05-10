//
//  ExpenseCategory.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
// copas semua ini mah dari data sourcenya raywenderleich, segues and more

import UIKit

class ExpenseCategory: NSObject {
    
    var expenses = [
        "Food",
        "Drink",
        "Hangout",
        "Entertainment",
        "Special Occasions",
        "Bills",
        "Impulsives",
        "Shopping",
        "Daily Needs",
        "Medicines",
        "Treat Person",
        "Taxes",
        "Illegal Charges"
    ]
    
    var selectedExpense: String? {
    didSet {
        if let selectedExpense = selectedExpense,
           let index = expenses.firstIndex(of: selectedExpense) {
            selectedExpenseIndex = index
            }
        }
    }
    
    var selectedExpenseIndex: Int?
    
    //MARK: - DATA SOURCES METHODS (copas dari raywenderleich)
    
    func selectExpense(at indexPath: IndexPath) {
        selectedExpense = expenses[indexPath.row]
    }
    
    func numberOfExpenses() -> Int {
        expenses.count
    }
    
    func expenseName(at indexPath: IndexPath) -> String {
        expenses[indexPath.row]
    }
}
