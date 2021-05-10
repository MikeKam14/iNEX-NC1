//
//  NotesIncomeViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 04/05/21.
//

import UIKit

class NotesIncomeViewController: UIViewController {
    @IBOutlet weak var notesIncomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notesIncomeTextField.layer.cornerRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
