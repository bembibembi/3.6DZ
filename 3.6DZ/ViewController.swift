//
//  ViewController.swift
//  3.6DZ
//
//  Created by 지구9 on 14/1/23.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var adressesTableView: UITableView!
    
    
    
    @IBOutlet weak var adressSearchView: UISearchBar!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
   //var adress: [String] = ["NEW YOUR", "CANADA" , "CHINA" , "KYRGYZSTAN", "RUSSIA" , "FRANCE", "ARGENTINA" , "MADRID" , "QATAR" , "TOKMOK" , "KAZAKHSTAN" , "UKRAINE" , "EGYPT" , "MEXICO"]
    
    var adress: [Adress] = [Adress(name: "CANADA", cost: 25345), Adress(name: "RUSSIA", cost: 345790),Adress(name: "TOKMOK", cost: 2784)]
    
    var array:[String] = []
    
    var addButton = UIButton(type: .system)
    var filterAdress: [Adress] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        adressesTableView.delegate = self
        adressesTableView.dataSource = self
        adressesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "adress_cell")
        
        
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterAdress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adress_cell", for: indexPath)
        cell.textLabel?.text = "\(adress[indexPath.row].name), \(adress[indexPath.row].cost)"
        return cell
    }

}
extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Zakazat", message: "Na Ulesu", preferredStyle: .alert)
        let acceptActon = UIAlertAction(title: "Ok", style: .destructive){
            Action in
            self.filterAdress.append(self.adress[indexPath.row])
            self.priceLabel.text! = "\(self.adress[indexPath.row].cost)"
            
        }
        alert.addAction(acceptActon)
        present(alert, animated: true)
    }
}
extension ViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let adress: [Adress] = [Adress(name: "Дордой", cost: 25345), Adress(name: "Орто-Сай", cost: 345790),Adress(name: "Чон - Арык", cost: 2784)]
        
        
        filterAdress = []
        if searchText == " "{
            filterAdress = adress
        } else {
            for i in adress {
                filterAdress.append(i)
            }
        }
        adressesTableView.reloadData()
    }
}
class Adress{
    var name: String
    var cost: Int
    init(name:String , cost: Int) {
        self.name = name
        self.cost = cost
        
    }
}
