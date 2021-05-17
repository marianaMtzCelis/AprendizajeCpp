//
//  ViewControllerFinCiclos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinCiclos: UIViewController {
    
    @IBOutlet weak var lblpts: UILabel!
    var puntos = 0
    @IBOutlet weak var tlPuntos: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblpts.text = String(puntos)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "volverCiclosSegue" {
            
            let viewCiclos = segue.destination as! ViewControllerCiclos
            
        } else if segue.identifier == "finGlobosMeuSegue" {
            
            let viewMenu = segue.destination as! ViewControllerMenu

        }
    }

}
