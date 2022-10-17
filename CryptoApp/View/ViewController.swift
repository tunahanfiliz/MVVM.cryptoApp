//
//  ViewController.swift
//  CryptoApp
//
//  Created by Ios Developer on 17.10.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [UIColor(red: 100/255, green: 40/255, blue: 33/255, alpha: 1),UIColor(red: 150/255, green: 140/255, blue: 133/255, alpha: 1),UIColor(red: 200/255, green: 240/255, blue: 232/255, alpha: 1),UIColor(red: 100/255, green: 40/255, blue: 33/255, alpha: 1),UIColor(red: 150/255, green: 40/255, blue: 50/255, alpha: 1),UIColor(red: 100/255, green: 12/255, blue: 111/255, alpha: 1)]
        
        
        
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection() //nilse sıfır degilse  insection demek.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        cell.backgroundColor = self.colorArray[indexPath.row % 6] // 6  adet renk şeyi var 6 ya bölümünden kalanı versin hiç bi zaman altıyı geçmesin renk sayısını yani app çökmesin
        
        return cell
    }

}

