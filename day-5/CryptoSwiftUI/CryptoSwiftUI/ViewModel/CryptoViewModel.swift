//
//  CryptoViewModel.swift
//  CryptoSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import Foundation

class CryptoListViewModel: ObservableObject{

    //burda publish edip diğer taraftan gözlemliyoruz.
    @Published var cryptoList = [CryptoViewModel]()
    @Published var errorMessage = ""
    
    let webservice = Webservice()
    
    func downloadCryptoAsync(url: URL) async{
        do {
            let cryptoList = try await webservice.downloadCurrenciesAsync(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptoList.map(CryptoViewModel.init)
            }
        } catch  {
            
        }

    }
    
    func downloadCrypto(url: URL) {
        webservice.downloadCurrencies(url: url) { result in
            switch result {
            case .success(let cryptos):
                DispatchQueue.main.async {
                    self.cryptoList = cryptos.map(CryptoViewModel.init)
                }
            case .failure(let error):
                switch error {
                case .badUrl:
                    self.errorMessage = "Bad URL"
                case .decodingError:
                    self.errorMessage = "Decoding ERROR"
                case .serverError:
                    self.errorMessage = "Server ERROR"
                }
            }
        }
    }
    
}

//modelin sadece kullandığımız parametrelerini almak için bunu kullanabiliriz.
struct CryptoViewModel {
    let crypto : Crypto
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String{
        crypto.currency
    }
    
    var price : String{
        crypto.price
    }
}
