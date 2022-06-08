//
//  Currency.swift
//  GetCurrency-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 02/06/22.
//

import Foundation

class Currency:Identifiable {
    
    var countryName:String?
    var countryCode:String?
    var currencyCode:String?
    var currencyName:String?
    var currencySymbol:String?
    
 }

extension Currency:CustomStringConvertible {
    var description: String {
        return "\nCountryCode   : \(self.countryCode!)\nName         : \(self.countryName!)\nCurrencyCode : \(self.currencyCode!)\ncurrencyName: \(self.currencyName!)\ncurrencySymbol: \(self.currencySymbol!)\n----------------------------"
    }
}
