//
//  ViewControllerFinTiposDeDatos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinTiposDeDatos: UIViewController {
    
    @IBOutlet weak var lbPts: UILabel!
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnJugar: UIButton!
    @IBOutlet weak var lbFinJuego: UILabel!
    @IBOutlet weak var lbpuntos2: UILabel!
    var pts : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let dispositivo = defaults.value(forKey: "dispositivo") as? String {
            if dispositivo == "ipad" {
                lbFinJuego.font = lbFinJuego.font.withSize(70)
                lbpuntos2.font = lbpuntos2.font.withSize(50)
                lbPts.font = lbPts.font.withSize(50)
               
//                btnMenu.titleLabel?.adjustsFontSizeToFitWidth = true
//                btnMenu.titleLabel?.minimumScaleFactor = 0.5
            }
            else if dispositivo == "ipod" {
                lbFinJuego.font = lbFinJuego.font.withSize(25)
                lbpuntos2.font = lbpuntos2.font.withSize(15)
                lbPts.font = lbPts.font.withSize(15)
//                btnMenu.titleLabel?.font = btnMenu.titleLabel?.font.withSize(15)
//                btnJugar.titleLabel?.font = btnJugar.titleLabel?.font.withSize(15)
            }
        }
        // Do any additional setup after loading the view.
        lbPts.text = String(pts)
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
