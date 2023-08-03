//
//  ViewController.swift
//  desafio4-ContactList
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class Tela02: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [(name: String,number: String, image :UIImage)] = []
//    func dadosTela01(){
//        let vc:Tela01? = UIStoryboard(name: "Tela01", bundle: nil).instantiateViewController(withIdentifier: "Tela01") as? Tela01
//        vc?.data[0] =
//        
//    }
//MARK: Teste
  
        weak var delegate: Tela02Delegate?
   

//MARK: Fim do teste

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
    }

    func configTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactListCell.nib(), forCellReuseIdentifier: ContactListCell.identifer2)
    }
}

extension Tela02: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        let item = data[indexPath.row]
        let configNome:String = "Nome: \(item.name)"
        let configNumber:String = "Telefone:  \(item.number)"
        cell?.recebeNome = configNome
        cell?.recebeNumber = configNumber
        cell?.recebeImage = item.image
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
protocol Tela02Delegate: AnyObject {
    func didSelectItem(name: String, number: String, image: UIImage)
}






