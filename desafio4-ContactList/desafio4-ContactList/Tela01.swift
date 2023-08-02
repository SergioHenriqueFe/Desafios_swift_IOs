//
//  ViewController.swift
//  desafio4-ContactList
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class Tela01: UIViewController {

    
    @IBOutlet weak var perfilImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var NumberTextField: UITextField!
    @IBOutlet weak var saveContactButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    func configTexFiel(){
        
    }
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.nib(), forCellReuseIdentifier: CustomCell.identifier)
        tableView.backgroundColor = UIColor.blue
    }

    @IBAction func tappedAddPhoto(_ sender: Any) {
        
    }
    
    @IBAction func tappedSaveContactButton(_ sender: Any) {
        
    }
    
    
}


//MARK: TableView Delegate
extension Tela01 : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: TexField Delegate


