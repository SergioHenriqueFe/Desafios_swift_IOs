//
//  ContactListCell.swift
//  desafio4-ContactList
//
//  Created by Sergio henrique Ferreira on 02/08/23.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    @IBOutlet weak var contactPerfilImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    static let identifer2 :String = "ContactListCell"
    static func nib()-> UINib{
        return UINib(nibName: self.identifer2, bundle: nil)
    }
    var recebeNome:String?{
        didSet{
            nameLabel.text = recebeNome
        }
    }
    var recebeNumber:String?{
        didSet{
            numberLabel.text = recebeNumber
        }
    }
    var recebeImage:UIImage?{
        didSet{
            contactPerfilImage.image = recebeImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    


    
}


