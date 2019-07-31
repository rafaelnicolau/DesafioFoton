//
//  UpLoadViewController.swift
//  Foton
//
//  Created by Rafael Ignacio da Silva Nicolau on 31/07/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class UpLoadViewController: UIViewController {

    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var lbOne: UILabel!
    @IBOutlet weak var lbTwo: UILabel!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
        // Do any additional setup after loading the view.
    }
    
    func formatView(){
        self.uiImage.image = self.image
        self.uiImage.layer.cornerRadius = 100
        self.lbOne.text = "Aguarde..."
        self.lbTwo.text = "Sua Foto está sendo carregada..."
    }


}
