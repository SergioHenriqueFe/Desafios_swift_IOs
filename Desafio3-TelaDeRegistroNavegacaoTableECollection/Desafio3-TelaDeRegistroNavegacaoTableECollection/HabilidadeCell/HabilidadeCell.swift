//
//  HabilidadeCell.swift
//  Desafio3-TelaDeRegistroNavegacaoTableECollection
//
//  Created by Sergio henrique Ferreira on 24/07/23.
//

import UIKit

class HabilidadeCell: UICollectionViewCell {
    @IBOutlet weak var teste2Image: UIImageView!
    
    static let configCollectionView : String = "HabilidadeCell"
    
    static func nib() -> UINib{
        return UINib(nibName:self.configCollectionView, bundle: nil)
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
