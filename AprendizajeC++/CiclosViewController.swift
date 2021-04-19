//
//  CiclosViewController.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 19/04/21.
//

import UIKit

class CiclosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ciclosFinSegue" {
            
            let viewFinCiclos = segue.destination as! FinCiclosViewController
            
        }
    }

}
