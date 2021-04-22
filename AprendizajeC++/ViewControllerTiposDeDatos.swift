//
//  ViewControllerTiposDeDatos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerTiposDeDatos: UIViewController {

    var listaDatosGlobo : [DatosGlobo]!
    var listaTiposDeDatos : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load balloon data (list of DatosGlobo)
        let rutaDatosGlobo = Bundle.main.path(forResource: "listaValores", ofType: "json")!

        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: rutaDatosGlobo))
            listaDatosGlobo = try JSONDecoder().decode([DatosGlobo].self, from: data)
        } catch {
            print("Error al cargar el archivo listaValores.json")
        }

        // Load tipos de datos (list of Strings)
        let rutaTiposDeDatos = Bundle.main.path(forResource: "tiposDeDatos", ofType: "json")!

        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: rutaTiposDeDatos))
            listaTiposDeDatos = try JSONDecoder().decode([String].self, from: data)
        } catch {
            print("Error al cargar el archivo tiposDeDatos.json")
        }
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "globosFinSegue" {
            
            let viewFinGlobos = segue.destination as! ViewControllerFinTiposDeDatos
            
        }
    }

}
