//
//  ViewController.swift
//  2-DesafioUITableViewCarros
//
//  Created by Sergio henrique Ferreira on 10/07/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var carrosDeLuxos :[String] = ["Rolls-Royce", "lamborghini","Jaguar", "Ferrari"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }
    //MARK: Aqui está indo para tela 02
    @IBAction func tappedGoScreenteste(_ sender: UIButton) {
        let vc :Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        
    }
    
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrosDeLuxos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setupCell(title: carrosDeLuxos[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if carrosDeLuxos[indexPath.row] == "Rolls-Royce"{
            let vc :Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
            self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }else if  carrosDeLuxos[indexPath.row] == "lamborghini"{
            let vc2 : Tela03VC? = UIStoryboard(name: "Tela03VC", bundle: nil).instantiateViewController(withIdentifier: "Tela03VC") as? Tela03VC
            self.navigationController?.pushViewController(vc2 ?? UIViewController(), animated: true)
        } else if  carrosDeLuxos[indexPath.row] == "Jaguar" {
            let vc3 : Tela04VC? = UIStoryboard(name: "Tela04VC", bundle: nil).instantiateViewController(withIdentifier: "Tela04VC") as? Tela04VC
            self.navigationController?.pushViewController(vc3 ?? UIViewController(), animated: true)
        } else if  carrosDeLuxos[indexPath.row] == "Ferrari"{
            let vc4 : Tela05VC? = UIStoryboard(name: "Tela05VC", bundle: nil).instantiateViewController(withIdentifier: "Tela05VC") as? Tela05VC
            self.navigationController?.pushViewController(vc4 ?? UIViewController(), animated: true)
            
        }
        
    }
    
    
    
}

