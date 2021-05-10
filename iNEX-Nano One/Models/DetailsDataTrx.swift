//
//  DetailsDataTrx.swift
//  iNEX-Nano One
//
//  Created by Michael Kam on 02/05/21.
// untuk tableview di transactin scene

import Foundation

struct TableTrx {
    var trxImage: String
    let trxLabel: String
    let trxValue: String
    
    init(trxImage: String, trxLabel: String, trxValue: String) {
        self.trxImage = trxImage
        self.trxLabel = trxLabel
        self.trxValue = trxValue
    }
}
