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
    
    override func viewDidAppear(_ animated: Bool) {
        if let frutasScene = SKScene(fileNamed: "FrutasScene") {
            frutasScene.scaleMode = .aspectFill
            skView.presentScene(frutasScene)
        }
    }
    
    override func viewDidLoad() {
        skView.leadingAnchor.constraint(equalTo: skView.leadingAnchor).isActive = true
        skView.trailingAnchor.constraint(equalTo: skView.trailingAnchor).isActive = true
        skView.topAnchor.constraint(equalTo: skView.topAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo: skView.bottomAnchor).isActive = true
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewControllerPalabrasReservadas.doaSegue), name: NSNotification.Name(rawValue: "doaSegue"), object: nil)


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
    
    @objc func doaSegue(){
           performSegue(withIdentifier: "frutasFinSegue", sender: self)
           self.view.removeFromSuperview()
           self.view = nil
       }
    
    override var shouldAutorotate: Bool {
        return false
    }

}
