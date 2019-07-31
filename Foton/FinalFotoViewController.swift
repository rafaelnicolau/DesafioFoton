//
//  FinalFotoViewController.swift
//  Foton
//
//  Created by Rafael Ignacio da Silva Nicolau on 30/07/19.
//  Copyright © 2019 Rafael Ignacio da Silva Nicolau. All rights reserved.
//

import UIKit

class FinalFotoViewController: UIViewController {

    @IBOutlet weak var lbText: UILabel!
    @IBOutlet weak var uiCamera: UIImageView!
    @IBOutlet weak var btFoto: UIButton!
   
    
    var photo: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatBar()
        uiCamera.image = photo

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UpLoadViewController
        vc.image = self.photo
    }
    
    func formatBar(){
        var nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.orange
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.orange]
    }
    
    @IBAction func btFoto(_ sender: Any) {
        performSegue(withIdentifier: "UpLoad", sender: nil)
    }
    
}
