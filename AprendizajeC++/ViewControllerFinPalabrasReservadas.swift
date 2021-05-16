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
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "volverFrutasSegue" {
            
            let viewFrutas = segue.destination as! ViewControllerPalabrasReservadas
            
        } else if segue.identifier == "finFrutasMenuSegue" {
            
            let viewMenu = segue.destination as! ViewControllerMenu
            
        }
    }
    
    func actualizaInterfaz() {
        
        let defaults = UserDefaults.standard
        let puntos = defaults.integer(forKey: "puntosFrutitas")
        lbPuntos.text = String(puntos)
        
    }

}
