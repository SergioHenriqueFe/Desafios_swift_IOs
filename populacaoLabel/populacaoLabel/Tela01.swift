//
//  ViewController.swift
//  populacaoLabel
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class Tela01: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var goActionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configTableView()
        configLabelAndTextField()
        
    }
    var customCell: CustomCellTableViewCell?
    
    var data: [(name: String, number: String)] = []
    @IBAction func tappedGoActionButton(_ sender: UIButton) {
        guard let name = nameTextField.text, let number = numberTextField.text else { return }
        data.append((name, number))
        tableView.reloadData()
        nameTextField.text = ""
        numberTextField.text = ""
        view.endEditing(true)
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCellTableViewCell.nib(), forCellReuseIdentifier: CustomCellTableViewCell.identifier)
    }
    
    func configLabelAndTextField(){
        nameTextField.placeholder = "Digite seu nome"
        numberTextField.placeholder = "Digite seu Telefone"
        nameTextField.delegate = self
        numberTextField.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

    }


}

extension Tela01 : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellTableViewCell.identifier, for: indexPath) as! CustomCellTableViewCell
        let item = data[indexPath.row]
        cell.recebeN = item.name
        cell.recebenumber = item.number
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}



