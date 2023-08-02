//
//  ViewController.swift
//  desafio4-ContactList
//
//  Created by Sergio henrique Ferreira on 01/08/23.
//

import UIKit

class Tela01: UIViewController {

    
    @IBOutlet weak var perfilImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var NumberTextField: UITextField!
    @IBOutlet weak var saveContactButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configImageView()
        configButton()
        configTexFiel()
    }
//MARK: Configurações de item da tela
    func configImageView(){
        //Deixar a imagem redonda
        perfilImageView.layer.cornerRadius = perfilImageView.frame.size
            .width/2.0
        perfilImageView.clipsToBounds = true
        perfilImageView.layer.masksToBounds = true
        perfilImageView.contentMode = .scaleToFill
        
    }
    
    func configButton(){
        addPhotoButton.setTitle("Adicionar Foto", for: .normal)
        saveContactButton.setTitle("Salvar contato", for: .normal)
    }
    
    func configTexFiel(){
        nameTextField.delegate = self
        NumberTextField.delegate = self
        nameTextField.placeholder  = "Digite o nome"
        NumberTextField.placeholder = "Digite o telefone"
        
    }
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.nib(), forCellReuseIdentifier: CustomCell.identifier)
        tableView.backgroundColor = UIColor.blue
    }
//MARK: IBaction
    
    @IBAction func tappedAddPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
//    var customCell:CustomCell?
    var data: [(name: String,number: String, image :UIImage)] = []
    @IBAction func tappedSaveContactButton(_ sender: Any) {
        guard let name = nameTextField.text, let number = NumberTextField.text, let image = perfilImageView.image else {return}
        data.append((name,number,image))
        tableView.reloadData()
        
        nameTextField.text = ""
        NumberTextField.text = ""
        perfilImageView.image = .init(systemName: "person")
        view.endEditing(true)
    }
    
    
}


//MARK: TableView Delegate
extension Tela01 : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        let item = data[indexPath.row]
        var configNome:String = "Nome: \(item.name)"
        var configNumber:String = "Telefone:  \(item.number)"
        cell?.recebeNome = configNome
        cell?.recebeNumber = configNumber
        cell?.recebeImage = item.image
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: TexField Delegate

extension Tela01 :UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: UIImagePicker
extension Tela01 : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            perfilImageView.image = pickedImage // Define a imagem selecionada na UIImageView.
        }
        
        picker.dismiss(animated: true, completion: nil) // Fecha a galeria após a seleção da imagem.
    }
    // Função que é chamada quando o usuário cancela a seleção de imagem na galeria.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil) // Fecha a galeria após o cancelamento.
    }
    
}
