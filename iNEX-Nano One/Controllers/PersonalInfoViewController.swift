//
//  PersonalInfoViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 30/04/21.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    let namaGua = NameHome() // deklarasi userdefault tuh gini. buat let atau var yang manggil di userdefault.
    
    var name = ""
    var initialBalance = 0
    
    
    @IBOutlet weak var fillNameTextField: UITextField!
    @IBOutlet weak var fillInitialBalanceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeHideKeyboard()
    }

    
    
    @IBAction func manageFinancePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHome", sender: self)
        NotificationCenter.default.post(name: Notification.Name("nama"), object: fillNameTextField.text) // ini pass data buat pemberi data
        namaGua.saveName(name: fillNameTextField.text ?? "")  // userdefault buat save dipanggil di ibaction button press
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if (segue.identifier == "goToHome") {
        //            if let homeVC = segue.destination as? HomeViewController {
        //            homeVC.passedName = fillNameTextField.text
        //            }
        //        }
        
        guard let homeVC = segue.destination as? HomeViewController else {
            return
        }
        homeVC.modalPresentationStyle = .fullScreen
        homeVC.passedName = fillNameTextField.text
        homeVC.passedBalance = Int(fillInitialBalanceTextField.text!) ?? 0
//        self.present(homeVC, animated: true, completion: nil)
        
    }
}

extension PersonalInfoViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == fillNameTextField {
            name = textField.text ?? ""
            print(name)
        } else {
            initialBalance = Int(textField.text ?? "0") ?? 0
            print(initialBalance)
        }
    }
}


extension PersonalInfoViewController {
    func initializeHideKeyboard() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
}
