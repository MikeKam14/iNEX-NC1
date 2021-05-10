//
//  NotesViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var notesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        notesTextField.layer.cornerRadius = 10
        }
}


