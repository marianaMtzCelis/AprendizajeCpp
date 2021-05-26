//
//  ViewControllerBienvenida.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerBienvenida: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // size - tanto ponerle un size a los labels igual para ipad

        // Do any additional setup after loading the view.

        guardaDatosInterfaz()
        
    }
    @IBAction func guardaDatosInterfaz() {
        let defaults = UserDefaults.standard
        var tipo = "iphone"
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            tipo = "ipod"
        }
        else if screenHeight >= 1080 {
            tipo = "ipad"
        }

        defaults.setValue(tipo, forKey: "dispositivo")

    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "startMenuSegue" {
            
            let viewMenu = segue.destination as! ViewControllerMenu
            
        }
    }

}
