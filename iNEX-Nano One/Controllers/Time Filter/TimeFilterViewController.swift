//
//  TimeFilterViewController.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 05/05/21.
//

import UIKit

class TimeFilterViewController: UIViewController {
    @IBOutlet weak var timeStaticTable: UIView!
    @IBOutlet weak var cancelTimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        
        timeStaticTable.layer.cornerRadius = 10
        timeStaticTable.clipsToBounds = true //biar mau di rounded

    }
    
    
    @IBAction func cancelTime(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindHomeTime", sender: self)
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
