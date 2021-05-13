//
//  ViewControllerCiclos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerCiclos: UIViewController {

    var listaDatosCiclo : [DatosCiclo]!
    var listaLabelsIncognitas : [UILabel]!
    var listaTextBoxIncognitas : [UITextField]!
    var iIncognitas : Int!
    @IBOutlet weak var HStackIncognitas: UIStackView!
    @IBOutlet weak var HStackTextFields: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load ciclos data (list of DatosCiclo)
        let rutaDatosCiclo = Bundle.main.path(forResource: "listaCiclos", ofType: "json")!

        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: rutaDatosCiclo))
            listaDatosCiclo = try JSONDecoder().decode([DatosCiclo].self, from: data)
        } catch {
            print("Error al cargar el archivo listaCiclos.json")
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ciclosFinSegue" {
            
            let viewFinCiclos = segue.destination as! ViewControllerFinCiclos
            
        }
    }

}
