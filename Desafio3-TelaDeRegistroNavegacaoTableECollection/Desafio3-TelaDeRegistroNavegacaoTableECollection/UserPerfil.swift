//
//  UserPerfil.swift
//  Desafio3-TelaDeRegistroNavegacaoTableECollection
//
//  Created by Sergio henrique Ferreira on 21/07/23.
//

import UIKit

class UserPerfil: UIViewController {

    @IBOutlet weak var name1Label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profession1Label: UILabel!
    
//    var listObjetoImaveBrand:[Exemplo] = [Exemplo(brand: "Habilidades", image: UIImage(named: "habilidades") ?? UIImage()),Exemplo(brand: "Ferramentas", image: UIImage(named: "ferramentas") ?? UIImage())]
    
    var listBrand :[String] = ["Habilidades","Cursos","Ferramentas"]
    var listImage :[String] = ["habilidades","cursos","ferramentas"]
    var name :String?
    init?(coder:NSCoder, name:String){
        self.name = name
        super.init(coder: coder )
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var profession :String?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.register(PerfilCellTableViewCell.nib(), forCellReuseIdentifier: PerfilCellTableViewCell.idenfier)
        
        
        name1Label.text = name
        name1Label.font = .boldSystemFont(ofSize: 20)
        
        profession1Label.text = profession
    }
    
   
    
    

}
extension UserPerfil : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBrand.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PerfilCellTableViewCell.idenfier, for: indexPath) as? PerfilCellTableViewCell
//        cell?.setupCell(nome: listBrand[indexPath.row])
//        cell?.backgroundColor = UIColor.blue
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.selectionStyle = .none
        cell?.setupCell(nome: listBrand[indexPath.row], imagem: listImage[indexPath.row])
        return cell ?? UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize (width:view.frame.width , height: view.frame.width)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listBrand[indexPath.row] == "Habilidades"{
            let habilidades:HabilidadesVC? = UIStoryboard(name: "HabilidadesVC", bundle: nil).instantiateViewController(withIdentifier: "HabilidadesVC") as? HabilidadesVC
            self.present(habilidades ?? UIViewController(), animated:  true )
        } else if listBrand[indexPath.row] == "Cursos"{
            let cursos : CursosVC? = UIStoryboard(name: "CursosVC", bundle: nil).instantiateViewController(withIdentifier: "CursosVC") as? CursosVC
            self.navigationController?.pushViewController(cursos ?? UIViewController(), animated: true)
        }
    }
    
    
}



