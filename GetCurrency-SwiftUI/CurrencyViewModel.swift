//
//  CurrencyViewModel.swift
//  GetCurrency-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 06/06/22.
//

import Foundation
import Combine

class CurrencyViewModel: ObservableObject {
    
    @Published var CurrencyData:[Currency] = []
    var cancellables = Set<AnyCancellable>()
    
    let currencyService = CurrencyDataService.instance
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        filterCurrency(searchQuery: "")
    }
    
    func filterCurrency(searchQuery:String){
        currencyService.$currencies
            .sink { [weak self] (returnedCurrencies) in
                if searchQuery.isEmpty {
                    self?.CurrencyData = returnedCurrencies
                } else {
                    self?.CurrencyData = returnedCurrencies.filter {
                        $0.currencyName!
                            .localizedCaseInsensitiveContains(searchQuery)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
