//
//  IncomeCategory.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
//

import UIKit

class IncomeCategory: NSObject {
    
    var incomes = [
        "Salary",
        "Gift",
        "Prize",
        "Passive income"
    ]
    
    var selectedIncome: String? {
    didSet {
        if let selectedIncome = selectedIncome,
           let index = incomes.firstIndex(of: selectedIncome) {
            selectedIncomeIndex = index
            }
        }
    }
    
    var selectedIncomeIndex: Int?
    
    //MARK: - DATA SOURCES METHODS (copas dari raywenderleich)
    
    func  selectIncome(at indexPath: IndexPath) {
        selectedIncome = incomes[indexPath.row]
    }
    
    func numberOfIncomes() -> Int {
        incomes.count
    }
    
    func incomeName(at indexPath: IndexPath) -> String {
        incomes[indexPath.row]
    }
}

