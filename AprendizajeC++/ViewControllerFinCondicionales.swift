//
//  ViewControllerFinCondicionales.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinCondicionales: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "volverCondicionalesSegue" {
            
            let viewCondicionales = segue.destination as! ViewControllerCondicionales
            
        } else if segue.identifier == "finCondicionalesMenuSegue" {
            
            let viewMenu = segue.destination as! ViewControllerMenu

        }
    }

}
