//
//  FinFrutasViewController.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 19/04/21.
//

import UIKit

class FinFrutasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "volverFrutasSegue" {
            
            let viewFrutas = segue.destination as! FrutasViewController
            
        } else if segue.identifier == "finFrutasMenuSegue" {
            
            let viewMenu = segue.destination as! MenuViewController
            
        }
    }

}
