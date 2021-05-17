//
//  ViewControllerFinTiposDeDatos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinTiposDeDatos: UIViewController {
    
    @IBOutlet weak var lbPts: UILabel!
    var pts : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbPts.text = String(pts)
    }
    
    
    @IBAction func volverAlMenu(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func volverAJugar(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
