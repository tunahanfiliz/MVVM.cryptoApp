//
//  CryptoCurrency.swift
//  CryptoApp
//
//  Created by Ios Developer on 17.10.2022.
//

import Foundation
// jsondaki degerlere bakıcan ne var ? currency ve price degerleri var o zaman burada bir struct model olusturcaz
// ardından structımızı : decodable yapıcaz bu nedemek ? çektigimiz binlerce kripto para birimini tek tek yazmak yerine bize kendi sıralayıp göstercek .

struct CryptoCurrency:Decodable{
    let currency : String
    let price : String
}
