//
//  TabBarController.swift
//  populacaoLabel
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configItems()
        confiTabar()

    }
    
    func configItems() {
        guard let item = tabBar.items else{return}
        item[0].title = "Novo contato"
        item[1].title = "Contatos"
        
        
    }
    
    func confiTabar(){
        tabBar.layer.borderWidth = 0.4
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }

}
