//
//  ContentView.swift
//  GetCurrency-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 02/06/22.
//

import SwiftUI

struct CurrencyView: View {
    
    @StateObject var cvm = CurrencyViewModel()
    @State var searchQuery = ""
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(cvm.CurrencyData){ currency in
                    HStack{
                        Image(currency.countryCode!)
                        VStack(alignment:.leading){
                            Text("\(currency.currencyCode!) - \(currency.currencyName!)")
                            Text(currency.countryName ?? "")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                 
                }
            }
            .navigationTitle("Currencies")
        }
        .searchable(text: $searchQuery)
        .onChange(of: searchQuery) { newValue in
            cvm.filterCurrency(searchQuery: newValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
