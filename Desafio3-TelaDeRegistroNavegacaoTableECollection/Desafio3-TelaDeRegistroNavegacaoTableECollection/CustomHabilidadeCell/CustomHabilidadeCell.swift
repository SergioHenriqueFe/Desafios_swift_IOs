//
//  CustomHabilidadeCell.swift
//  Desafio3-TelaDeRegistroNavegacaoTableECollection
//
//  Created by Sergio henrique Ferreira on 24/07/23.
//

import UIKit

class CustomHabilidadeCell: UICollectionViewCell {
    
    @IBOutlet weak var testeproffiseonImage: UIImageView!
    
    static let identifierCollection :String = "CustomHabilidadeCell"
    
    static func nib() ->UINib {
        return UINib(nibName: self.identifierCollection, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCollectionCell(nameImage:String){
        testeproffiseonImage.image = UIImage(named: nameImage)
    }
}
