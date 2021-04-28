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
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "volverGlobosSegue" {
            
            let viewGlobos = segue.destination as! ViewControllerTiposDeDatos
            
        } else if segue.identifier == "finGlobosMenuSegue" {
            
            let viewMenu = segue.destination as! ViewControllerMenu
            
        }
    }

}
