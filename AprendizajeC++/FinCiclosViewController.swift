//
//  FinCiclosViewController.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 19/04/21.
//

import UIKit

class FinCiclosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "volverCiclosSegue" {
            
            let viewCiclos = segue.destination as! CiclosViewController
            
        } else if segue.identifier == "finGlobosMeuSegue" {
            
            let viewMenu = segue.destination as! MenuViewController

        }
    }

}
