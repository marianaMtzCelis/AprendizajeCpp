//
//  ViewControllerMenu.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "menuGlobosSegue" {
            
            let viewGlobos = segue.destination as! ViewControllerTiposDeDatos
            
        } else if segue.identifier == "menuCiclosSegue" {
            
            let viewCiclos = segue.destination as! ViewControllerCiclos
            
        } else if segue.identifier == "menuFrutasSegue" {
            
            let viewFrutas = segue.destination as! ViewControllerPalabrasReservadas
            
        } else if segue.identifier == "menuCondicionalesSegue" {
            
            let viewCondicionales = segue.destination as! ViewControllerCondicionales
            
        }
        
    }

}
