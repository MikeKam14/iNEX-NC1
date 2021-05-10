//
//  NameDefaults.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
// ini cara pake userdefaults, untuk passing data name dari isi personal data ke Home

import Foundation

struct NameHome {
    func getName() -> String {
        return UserDefaults.standard.string(forKey: "myName") ?? "No Name"
    }
    
    func saveName(name: String) {
        UserDefaults.standard.set(name, forKey: "myName")
    }
}
