//
//  PerfilCellTableViewCell.swift
//  Desafio3-TelaDeRegistroNavegacaoTableECollection
//
//  Created by Sergio henrique Ferreira on 22/07/23.
//

import UIKit

class PerfilCellTableViewCell: UITableViewCell {
    
    
    
    static let idenfier :String = "PerfilCellTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.idenfier, bundle: nil)
    }
    
    @IBOutlet weak var testeLabel: UILabel!
    
    @IBOutlet weak var testeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell( nome:String,imagem: String) {
        testeLabel.text = nome
        testeImage.image = UIImage(named: imagem)
    }
 
    
}
