//
//  HomeViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 01/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    let namaGuaDisini = NameHome()
    
    var lastIndex = 0
    
    var passedName: String? // untuk ambil nama (alternatif dari notif-observer yang gagal karena embed navigation view)
    var passedBalance: Int = 0
    
    var financeArray: [FinancesList] = []
    
    var newFinanceList: FinancesList?
    
    var balanceStatement: Int = 0
    var totalIncome: Int = 0
    var totalExpense: Int = 0
    
//    var financeDataSource = FinanceDataSource()
    
    //MARK: Label untuk perhitungan
    
    @IBOutlet weak var incomeSumLabel: UILabel!
    
    @IBOutlet weak var expenseSumLabel: UILabel!
    
    
    // MARK: OUTLETS
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var initialBalance: UILabel!
    
    @IBOutlet weak var listFinance: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("nama"), object: nil)
        
        financeArray.append(FinancesList(symbol: "positive", type: "Income", date: NSDate(), cost: passedBalance))
        
        
        // notifcenter default add observer itu buat pass data si penerima. Pass data gagal semenjak embed home view pake navigation
        
        nameLabel.text = passedName //(gagal, labelnya jadi ga ada. ini pake metode prepare for segue)
        
        initialBalance.text = String(passedBalance.formattedWithSeparator)
        balanceStatement = passedBalance
        
     //   nameLabel.text = namaGuaDisini.getName() // ini manggil si userdefault
        
        
        listFinance.delegate = self
        listFinance.dataSource = self
        listFinance.rowHeight = UITableView.automaticDimension
        listFinance.estimatedRowHeight = 60
        
        listFinance.layer.cornerRadius = 5
        
    //    calculateIncome()
    //    calculateExpense()
    //    calculateBalance()
        
    //    updateBalanceUI()

    }
    override func viewWillAppear(_ animated: Bool) {
        if lastIndex < financeArray.count {
            calculateIncome()
        }
        updateBalanceUI()
    }
    
    @objc func didGetNotification(_ notification: Notification) {
        let nama = notification.object as! String?
        nameLabel.text = nama
    }
    
    func updateBalanceUI() {
        incomeSumLabel.text = String(totalIncome.formattedWithSeparator)
        expenseSumLabel.text = String(totalExpense.formattedWithSeparator)
        initialBalance.text = String(balanceStatement.formattedWithSeparator)
    }
    
    func calculateIncome() {
//        for finance in financeArray {
        let finance = financeArray[financeArray.count-1]
        
        lastIndex += 1
        
        if finance.type == "Income" {
                totalIncome += finance.cost!
            } else {
                totalExpense += finance.cost!
            }
//        }
        
        balanceStatement = totalIncome - totalExpense
    }
    
//    func calculateExpense() {
//        for finance in financeArray {
//            if finance.type == "Expense" {
//                totalExpense += finance.cost!
//            }
//        }
//    }
    
//    func calculateBalance() {
//        balanceStatement = totalIncome - totalExpense
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return financeArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCellContent", for: indexPath) as! HomeContentTableViewCell
        
        cell.financeFill = financeArray[indexPath.row]
        
        return cell
    }
}

extension HomeViewController {
    @IBAction func saveToHomeTableView(_ segue: UIStoryboardSegue) {
//        guard let trxViewController = segue.source as? TransactionViewController,
//              let financeFill = trxViewController.financesFill
//        else { return }
//        financeDataSource.append(finance: financeFill, to: tableView) --> ini tuh mau coba pake tableview ga bisa karena emg belum sempet connect outlet, terus juga ternyata ada typo identifier, coba untuk di revise besok. kalo pake append dan identifier bener
        
        financeArray.append(newFinanceList ?? FinancesList(symbol: "positive", type: "Income", date: NSDate(), cost: 0))
        self.listFinance.reloadData()
        
//        calculateBalance()
//        calculateExpense()
//        calculateIncome()
    }
    
    
    @IBAction func unwindToHomeFromTime(_ segue: UIStoryboardSegue) {
        
    }
}


