//
//  CustomCollectionViewCell.swift
//  Desafio-CollectionComTableview
//
//  Created by Sergio henrique Ferreira on 17/07/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var carImageView: UIImageView!
    static let identifierCollection :String = "CustomCollectionViewCell"
    
    static func nibCollectionView()->UINib{
        return UINib(nibName: self.identifierCollection, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carImageView.contentMode = .scaleAspectFill
    }
    
    func setupCell(nameImage:String){
        carImageView.image = UIImage (named: nameImage)
    }

}
