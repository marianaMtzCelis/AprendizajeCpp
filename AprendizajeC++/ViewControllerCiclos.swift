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
    @IBOutlet weak var scrollView: UIScrollView!
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
        
        // Setup scrollview
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Initialize textbox list
        listaTextBoxIncognitas = [UITextField]()
        let indice = Int.random(in: 0..<listaDatosCiclo.count)
        mostrarCiclo(indiceCiclo: indice)
    }
    
    func mostrarCiclo(indiceCiclo: Int) {
        let cCiclo = listaDatosCiclo[indiceCiclo]
        iIncognitas = cCiclo.respuestas.count
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

extension ViewControllerCiclos : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return ImagenCiclo
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = ImagenCiclo.image {
                let ratioW = ImagenCiclo.frame.width / image.size.width
                let ratioH = ImagenCiclo.frame.height / image.size.height
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                let conditionLeft = newWidth * scrollView.zoomScale > ImagenCiclo.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - ImagenCiclo.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditionTop = newHeight * scrollView.zoomScale > ImagenCiclo.frame.height
                let top = 0.5 * (conditionTop ? newHeight - ImagenCiclo.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
