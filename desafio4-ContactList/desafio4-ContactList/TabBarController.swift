//
//  ViewController.swift
//  desafio4-ContactList
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBarItem()
        configTabBar()
    }

    func configTabBarItem(){
        guard let item = tabBar.items else {return}
        item[0].title = "Novo Contato"
        item[1].title = "Lista de Contatos"
        
        
    }
    
    func configTabBar(){
        tabBar.layer.borderWidth = 0.4
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.layer.backgroundColor = UIColor.systemGray4.cgColor
    }
}

