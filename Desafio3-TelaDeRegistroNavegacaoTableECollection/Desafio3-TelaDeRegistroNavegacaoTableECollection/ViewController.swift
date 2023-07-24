//
//  ViewController.swift
//  Desafio3-TelaDeRegistroNavegacaoTableECollection
//
//  Created by Sergio henrique Ferreira on 21/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titlePageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePageLabel.textAlignment = .center
        titlePageLabel.text = "Cadastre-se"
        titlePageLabel.font = .boldSystemFont(ofSize: 30)
        nameLabel.text = "Nome Completo:"
        nameLabel.font = .boldSystemFont(ofSize: 20)
        emailLabel.text = "Digite seu E-mail:"
        emailLabel.font = .boldSystemFont(ofSize: 20)
        telLabel.text = "Telefone"
        telLabel.font = . boldSystemFont(ofSize:  20)
        professionLabel.text = "Profissão: "
        professionLabel.font = .boldSystemFont(ofSize: 20)
        passwordLabel.text = "Digite sua senha"
        passwordLabel.font = .boldSystemFont(ofSize: 20)
        
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        telTextField.keyboardType = .numberPad
        professionTextField.keyboardType = .default
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.placeholder = "Exemplo: Sérgio Henrique Ferreira"
        emailTextField.placeholder = "exemplo : sergio.hefe@hotmail.com"
        telTextField.placeholder = "(DD)996302766"
        professionTextField.placeholder = "Devesenvolvedor IOS"
        passwordTextField.placeholder = "Digite sua senha"
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        telTextField.delegate = self
        professionTextField.delegate = self
        passwordTextField.delegate = self
        
       
                
        
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.backgroundColor = .black
        registerButton.isEnabled = false
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        registerButton.setTitleColor(.white, for: .normal)
        
    }

    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        // navegação de paginas + pegar conteudo da pagina anterior
        let vc : UserPerfil? = UIStoryboard(name: "UserPerfil", bundle: nil)
            .instantiateViewController(identifier: "UserPerfil") { coder  in
                return UserPerfil(coder: coder,name: "Seja Bem-Vindo " +  (self.nameTextField.text ?? " "))
            }
        vc?.profession = self.professionTextField.text
        
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func validateTextField(){
        if nameTextField.text != "" && emailTextField.text != "" && telTextField.text != "" && professionTextField.text != "" && passwordTextField.text != "" {
            
            registerButton.isEnabled = true
        }else{
            registerButton.isEnabled = false
        }
    }
    
    func isValidEmail(_ email : String) ->Bool {
        let emailRegex =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
  
        
}


extension ViewController : UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        validateTextField()
        
        if textField == emailTextField {
            if let email = textField.text {
                if !isValidEmail(email) && !email.contains("@") {
                    emailLabel.text = "insira um e-mail valido"
                    emailLabel.textColor = UIColor.red
                    textField.layer.borderWidth = 1
                    textField.layer.borderColor = UIColor.red.cgColor
                    
                } else {
                    emailLabel.text = "Digite seu E-mail"
                    emailLabel.textColor = UIColor.black
                    textField.layer.borderColor = UIColor.clear.cgColor
                    
                }
            }
        }
        
//        if textField == passwordTextField {
//            if let senha = textField.text{
//                
//            }
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == telTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            
            if !allowedCharacters.isSuperset(of: characterSet) {
                return true
            }
            
            if let text = textField.text, let rangeOfTextToReplace = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: rangeOfTextToReplace, with: string)
                let numericString = updatedText.components(separatedBy: allowedCharacters.inverted).joined()
                
                if numericString.count > 11 {
                    return false
                }
                
                var formattedText = ""
                
                if numericString.count >= 2 {
                    let dddIndex = numericString.index(numericString.startIndex, offsetBy: 2)
                    formattedText = "(\(numericString.prefix(2))) "
                    formattedText += numericString.suffix(from: dddIndex)
                } else {
                    formattedText = numericString
                }
                
                textField.text = formattedText
                return false
            }
        }
        
        return true
        

    }
    
}

