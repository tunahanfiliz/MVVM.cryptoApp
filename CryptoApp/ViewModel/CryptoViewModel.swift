//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Ios Developer on 17.10.2022.
//

import Foundation
// dizi haliyle normal tekil cryptoCurrency i birbirine baglamaya calısmalıyız ikiside bu sayfada olcak
//view model yazma amacımız diger view tarafında bunları kullanmak

//extension oluşturulmus struct ya da classa ekleme yapmak demek.
// MVMM SADELİK VE ANLAŞILABİLİRLİK İÇİN BÖYLE KULLANILABİLİR

struct CryptoListViewModel {
    
    let cryptoCurrencyList : [CryptoCurrency] //bunu olusturdukdan sonra alttakı 2 . structa git sonra dön
    
    
    
}

extension CryptoListViewModel{
    func numberOfRowsInSection() ->Int{
        return self.cryptoCurrencyList.count // dizide kaçtane crpyito var versin
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel{   // bi index isticez ve bize crpytoviewmodel döndürecek böylece 2 sini baglarız
        let crypto = self.cryptoCurrencyList[index] //listten indexi al ve
        return CryptoViewModel(cryptoCurrency: crypto)   // crytoviewmodel döndür dicez o bize obje olusturcak.
    }
    
}


struct CryptoViewModel{
    
    let cryptoCurrency : CryptoCurrency  // burası tekil kısmı diziden cektigimiz seyle bunu birleştircez
    
    var name: String{
        return self.cryptoCurrency.currency
    }
    
    var price: String{
        return self.cryptoCurrency.price
    }
}
