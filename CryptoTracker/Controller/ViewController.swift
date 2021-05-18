//
//  ViewController.swift
//  CryptoTracker
//
//  Created by harsh yadav on 18/05/21.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    var arrData = [CryptoData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto Tracker"
        getAllCryptoData()
        
    }
    
    func getAllCryptoData(){
        let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/?apikey=E154E224-52F2-4C7A-ADD8-58F2812B92DC")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                if let safedata = data {
                    do{
                        self.arrData = try JSONDecoder().decode([CryptoData].self, from: safedata)
                        let sortArr = self.arrData
                        _ = sortArr.sorted{ first , second -> Bool in
                            return first.price_usd ?? 0 > second.price_usd ?? 0
                            
                        }
                        DispatchQueue.main.async {
                            
                            self.arrData.sort { (first, second ) -> Bool in
                                return first.price_usd ?? 0 > second.price_usd ?? 0
                            }
                            self.tableView.reloadData()
                        }
                    }catch{
                        print(error.localizedDescription )
                    }
                }
            }
        }.resume()
}
}

extension ViewController : UITableViewDataSource , UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        Cell.lblName.text = " Name - \(arrData[indexPath.row].name ?? "")"
        Cell.lblPrice.text = " $\(String(arrData[indexPath.row].price_usd ?? 0))"
        Cell.lblId.text = arrData[indexPath.row].asset_id
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

