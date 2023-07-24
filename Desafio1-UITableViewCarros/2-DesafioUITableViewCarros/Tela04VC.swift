//
//  Tela04VC.swift
//  2-DesafioUITableViewCarros
//
//  Created by Sergio henrique Ferreira on 10/07/23.
//

import UIKit

class Tela04VC: UIViewController {
    

    @IBOutlet weak var JaguarImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JaguarImage.image = UIImage(named: "Jaguar")
        JaguarImage.contentMode = .scaleAspectFit
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
