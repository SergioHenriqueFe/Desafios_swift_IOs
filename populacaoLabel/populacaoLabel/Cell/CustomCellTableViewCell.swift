//
//  CustomCellTableViewCell.swift
//  populacaoLabel
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    @IBOutlet weak var recebeNomeLabel: UILabel!
    @IBOutlet weak var recebeNumberLabel: UILabel!

    static let identifier:String = "CustomCellTableViewCell"
    static func nib()->UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    var recebeN: String? {
        didSet {
            recebeNomeLabel.text = recebeN
        }
    }
    
    var recebenumber: String? {
        didSet {
            recebeNumberLabel.text = recebenumber
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
}




