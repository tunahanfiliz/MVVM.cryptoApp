//
//  WebService.swift
//  CryptoApp
//
//  Created by Ios Developer on 17.10.2022.
//

import Foundation
// internetten verileri çekme işlemleri

//@escaping döndürecegimiz data ne [crptocurrency]?(dizi olarak yazıcaz çğnkü gelen veriler çok fazla ve dizi olarak geliyor. ve optional yap ineternet falan kesilir) ne olarak döndürecegimizide -> yapıp belirliyoruz. Completion closure işlemleri için gerekli

class Webservice{
    
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) // hata varsa data mata yok kardeşim demek için.
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data) //protokol istiyor decode o da [croytocurrency].self
                
                print(cryptoList)
                if let cryptoList = cryptoList{  // if let yapma amacımız optinaldan .? çıkarmak
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
