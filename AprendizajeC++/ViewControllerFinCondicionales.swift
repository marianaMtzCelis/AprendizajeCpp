//
//  ViewControllerFinCondicionales.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinCondicionales: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func volverAlMenu(_ sender: Any) {
        if let first = presentingViewController,
            let second = first.presentingViewController{
                first.view.isHidden = true
                second.dismiss(animated: true)
            }
    }
    
    @IBAction func volverAJugar(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
