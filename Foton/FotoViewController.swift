//
//  FotoViewController.swift
//  Foton
//
//  Created by Rafael Ignacio da Silva Nicolau on 30/07/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class FotoViewController: UIViewController {

    @IBOutlet weak var lbSendFoto: UILabel!
    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var imageSelfie: UIImageView!
    @IBOutlet weak var lbOne: UILabel!
    @IBOutlet weak var lbTwo: UILabel!
    @IBOutlet weak var lbThree: UILabel!
    @IBOutlet weak var lbFour: UILabel!
    @IBOutlet weak var btFoto: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FinalFotoViewController
        vc.photo = sender as? UIImage
    }
    
    func formatView(){
        self.btFoto.layer.cornerRadius = 10
        self.lbSendFoto.text = "Envie sua Foto"
        self.lbOne.text = "Para sua segurança, \n tire uma foto do seu rosto"
        self.lbTwo.text = "> Procure um ambiente claro;"
        self.lbThree.text = "> Somente você deve aparecer na foto;"
        self.lbFour.text = "> Não utilize acessórios como ocúlos, \n chapéu, boné, etc."
    }
    
    func alerta(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default ))
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectPickture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btFoto(_ sender: Any) {
        
        let alert = UIAlertController(title: "Selecionar Foto", message: "De onde você quer escolher a sua foto?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Câmera", style: .default, handler: { (action) in
                self.selectPickture(sourceType: .camera)
                })
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de Fotos", style: .default) { (action) in
            self.selectPickture(sourceType: .photoLibrary)
        }
            alert.addAction(libraryAction)
    
        let photoAction = UIAlertAction(title: "Album de Fotos", style: .default) { (action) in
            self.selectPickture(sourceType: .savedPhotosAlbum)
        }
            alert.addAction(photoAction)
            
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        
        }
}
    



extension FotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let originalWidth = image.size.width
            let aspectRatio = originalWidth / image.size.height
            var smallSize: CGSize
            if aspectRatio > 1 {
                smallSize = CGSize(width: 1000, height: 1000/aspectRatio)
            }else {
                smallSize = CGSize(width: 1000*aspectRatio, height: 1000)
            }
            
            UIGraphicsBeginImageContext(smallSize)
            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            dismiss(animated: true, completion: {
                self.performSegue(withIdentifier: "finalfoto", sender: smallImage)
            })
        }
    }
}
