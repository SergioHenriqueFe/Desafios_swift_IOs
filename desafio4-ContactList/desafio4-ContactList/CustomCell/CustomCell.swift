//
//  CustomCell.swift
//  desafio4-ContactList
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var recebidoPerfilImageVIew: UIImageView!
    @IBOutlet weak var recebidoNameLabel: UILabel!
    @IBOutlet weak var recebidoNumberLabel: UILabel!
    
    
    
    static let identifier = "CustomCell"
    static func nib()->UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    
}
