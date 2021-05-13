//
//  ViewControllerCiclos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerCiclos: UIViewController {

    var listaDatosCiclo : [DatosCiclo]!
    var listaTextBoxIncognitas : [UITextField]!
    var iIncognitas : Int!
    @IBOutlet weak var VStackPreguntas: UIStackView!
    @IBOutlet weak var ImagenCiclo: UIImageView!
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
    
    override func viewWillAppear(_ animated: Bool) {
        // Initialize textbox list
        listaTextBoxIncognitas = [UITextField]()
        var indice = Int.random(in: 0..<listaDatosCiclo.count)
        indice = 3
        mostrarCiclo(indiceCiclo: indice)
    }
    
    func mostrarCiclo(indiceCiclo: Int) {
        let cCiclo = listaDatosCiclo[indiceCiclo]
        iIncognitas = cCiclo.respuestas.count
        print(iIncognitas)
        // set code image
        ImagenCiclo.image = UIImage(named: cCiclo.nombre_imagen)
        for i in 0..<iIncognitas {
            // Create label
            let label = UILabel()
            label.text = cCiclo.incognitas[i]
            // Create text field
            let textField = UITextField()
            textField.backgroundColor = .white
            listaTextBoxIncognitas.append(textField)
            // Create HStack
            let HStack = UIStackView()
            HStack.axis = .horizontal
            HStack.alignment = .center
            HStack.distribution = .fillEqually
            HStack.addArrangedSubview(label)
            HStack.addArrangedSubview(textField)
            VStackPreguntas.addArrangedSubview(HStack)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ciclosFinSegue" {
            
            let viewFinCiclos = segue.destination as! ViewControllerFinCiclos
            
        }
    }

}
