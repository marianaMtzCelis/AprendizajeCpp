//
//  ViewControllerFinCiclos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinCiclos: UIViewController {
    
 
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnJugar: UIButton!
    @IBOutlet weak var lbpuntos2: UILabel!
    @IBOutlet weak var lbFinJuego: UILabel!
    @IBOutlet weak var lblpts: UILabel!
    var puntos = 0
    @IBOutlet weak var tlPuntos: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let dispositivo = defaults.value(forKey: "dispositivo") as? String {
            if dispositivo == "ipad" {
                lbFinJuego.font = lbFinJuego.font.withSize(45)
                lbpuntos2.font = lbpuntos2.font.withSize(30)
                lblpts.font = lblpts.font.withSize(30)
                btnMenu.titleLabel?.font =
                    btnMenu.titleLabel?.font.withSize(30)
                btnJugar.titleLabel?.font = btnJugar.titleLabel?.font.withSize(30)
                
            }
            else if dispositivo == "ipod" {
                lbFinJuego.font = lbFinJuego.font.withSize(25)
                lbpuntos2.font = lbpuntos2.font.withSize(15)
                lblpts.font = lblpts.font.withSize(15)
                btnMenu.titleLabel?.font =
                    btnMenu.titleLabel?.font.withSize(15)
                btnJugar.titleLabel?.font = btnJugar.titleLabel?.font.withSize(15)
            }
        }
        // Do any additional setup after loading the view.
        lblpts.text = String(puntos)
    }
    
    
    @IBAction func volverAlMenu(_ sender: Any) {
        if let first = presentingViewController,
            let second = first.presentingViewController{
                first.view.isHidden = true
                second.dismiss(animated: true)
            }
    }
    
    
}
