//
//  Tela02VC.swift
//  2-DesafioUITableViewCarros
//
//  Created by Sergio henrique Ferreira on 10/07/23.
//

import UIKit

class Tela02VC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var UIimageFerrari: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIimageFerrari.image = UIImage(named:"rollsRoys")
        UIimageFerrari.contentMode = .scaleAspectFill
        titleLabel.text = "Rolls-Royce"
        
        
    }
    

}
