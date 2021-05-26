//
//  ViewControllerFinPalabrasReservadas.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinPalabrasReservadas: UIViewController {
    
    @IBOutlet weak var lbPuntos: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        actualizaInterfaz()
    }
    
    
    @IBAction func volverAMenu(_ sender: Any) {
        if let first = presentingViewController,
            let second = first.presentingViewController{
                first.view.isHidden = true
                second.dismiss(animated: true)
            }
    }
    
    @IBAction func volverAJugar(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    func actualizaInterfaz() {
        
        let defaults = UserDefaults.standard
        let puntos = defaults.integer(forKey: "puntosFrutitas")
        lbPuntos.text = String(puntos)
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

}
