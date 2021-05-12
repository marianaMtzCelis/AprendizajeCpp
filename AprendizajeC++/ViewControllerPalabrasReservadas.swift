//
//  ViewControllerPalabrasReservadas.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit
import SpriteKit

class ViewControllerPalabrasReservadas: UIViewController {

    var listaDatosFrutas : [DatosFruta]!
    
    @IBOutlet weak var skView: SKView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load fruit data (list of DatosFruta)
        let rutaDatosFruta = Bundle.main.path(forResource: "listaPalabras", ofType: "json")!

        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: rutaDatosFruta))
            listaDatosFrutas = try JSONDecoder().decode([DatosFruta].self, from: data)
        } catch {
            print("Error al cargar el archivo listaValores.json")
        }
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "frutasFinSegue" {
            
            let viewFinFrutas = segue.destination as! ViewControllerFinPalabrasReservadas
            
        }
    }

}
