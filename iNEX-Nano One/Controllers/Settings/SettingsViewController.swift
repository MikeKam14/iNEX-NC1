//
//  SettingsViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 05/05/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsStaticTable: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsStaticTable.layer.cornerRadius = 10
        settingsStaticTable.clipsToBounds = true
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
