//
//  CustomTableViewCell.swift
//  2-DesafioUITableViewCarros
//
//  Created by Sergio henrique Ferreira on 10/07/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    static let identifier : String = "CustomTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setupCell (title :String){
        titleLabel.text = title
    }
    
    
    @IBAction func tappedGoScreen(_ sender: UIButton) {
        let _ : Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        
        
    }
    
    
}
