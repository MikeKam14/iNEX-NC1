//
//  MainViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 30/04/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var getStarted: UIButton!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func getStartedPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToPersonalInformation", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destVC = segue.destination as? PersonalInfoViewController {
//        destVC.modalPresentationStyle = .fullScreen  //ini untuk fullscreen present. harusnya ada cara lain yang lebih bagus buat bukan show sebagai modal
//        self.present(destVC, animated: true, completion: nil)
//        }
//    }
}
