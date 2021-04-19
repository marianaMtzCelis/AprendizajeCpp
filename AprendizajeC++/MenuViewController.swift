//
//  MenuViewController.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 19/04/21.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "menuGlobosSegue" {
            
            let viewGlobos = segue.destination as! GlobosViewController
            
        } else if segue.identifier == "menuCiclosSegue" {
            
            let viewCiclos = segue.destination as! CiclosViewController
            
        } else if segue.identifier == "menuFrutasSegue" {
            
            let viewFrutas = segue.destination as! FrutasViewController
        }
        
    }

}
