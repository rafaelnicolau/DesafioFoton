//
//  LoginViewController.swift
//  Foton
//
//  Created by Rafael Ignacio da Silva Nicolau on 30/07/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var lbCartaoVirtual: UILabel!
    @IBOutlet weak var imageLogin: UIImageView!
    @IBOutlet weak var tfNIS: UITextField!
    @IBOutlet weak var txSenha: UITextField!
    @IBOutlet weak var btlogin: UIButton!
    
    private var id = "123456"
    private var senha = 123456
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btlogin.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    func validate() -> Bool{
        if let id = tfNIS.text, let senha = txSenha.text {
            if id == self.id, senha == String(self.senha){
                return true
            }else {
                return false
            }
        }
        return false
    }
    
    func alerta(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default ))
        self.present(alert, animated: true, completion: nil)
    }

    
    @IBAction func btLogin(_ sender: Any) {
        if validate() {
            performSegue(withIdentifier: "foto", sender: nil)
            self.tfNIS.text = ""
            self.txSenha.text = ""
        }else {
            self.tfNIS.text = ""
            self.txSenha.text = ""
            alerta(title: "Atenção", message: "Usuário ou Senha não confere.")
        }
    }
    
}
