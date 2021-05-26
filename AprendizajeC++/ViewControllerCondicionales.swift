//
//  ViewControllerCondicionales.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerCondicionales: UIViewController {
    var listaDatosCondicionales : [DatosCondicionales]!
//    var iIncognitas : Int!
    var puntos : Int!
    var intentos : Int!
    var preguntaActual : DatosCondicionales!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imagenPregunta: UIImageView!
    @IBOutlet weak var opcion1: UIButton!
    @IBOutlet weak var opcion2: UIButton!
    @IBOutlet weak var opcion3: UIButton!
    @IBOutlet weak var opcion4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Load ciclos data (list of DatosCiclo)
        let rutaDatosCondicional = Bundle.main.path(forResource: "listaCondicionales", ofType: "json")!

        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: rutaDatosCondicional))
            listaDatosCondicionales = try JSONDecoder().decode([DatosCondicionales].self, from: data)
        } catch {
            print("Error al cargar el archivo listaCondicionales.json, \(error)")
        }
        
        // Setup scrollview
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Se hace aleatorio el orden de las preguntas
        listaDatosCondicionales.shuffle()
        
        puntos = 0
        intentos = 0
        actualizarPregunta()
    }
    
    func actualizarPregunta() {
        preguntaActual = listaDatosCondicionales[intentos]
        imagenPregunta.image = UIImage(named: preguntaActual.nombre_imagen)
        opcion1.setTitle(preguntaActual.respuestas[0], for: .normal)
        opcion2.setTitle(preguntaActual.respuestas[1], for: .normal)
        opcion3.setTitle(preguntaActual.respuestas[2], for: .normal)
        opcion4.setTitle(preguntaActual.respuestas[3], for: .normal)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: - Escoger respuestas
    @IBAction func escogerOpcion1(_ sender: UIButton) {
        if sender.titleLabel?.text == preguntaActual.correcta {
            respuesta(correcta: true)
        }
        else{
            respuesta(correcta: false)
        }
    }
    
    @IBAction func escogerOpcion2(_ sender: UIButton) {
        if sender.titleLabel?.text == preguntaActual.correcta {
            respuesta(correcta: true)
        }
        else{
            respuesta(correcta: false)
        }
    }
    
    @IBAction func escogerOpcion3(_ sender: UIButton) {
        if sender.titleLabel?.text == preguntaActual.correcta {
            respuesta(correcta: true)
        }
        else{
            respuesta(correcta: false)
        }
    }
    
    @IBAction func escogerOpcion4(_ sender: UIButton) {
        if sender.titleLabel?.text == preguntaActual.correcta {
            respuesta(correcta: true)
        }
        else{
            respuesta(correcta: false)
        }
    }
    
    func respuesta(correcta : Bool) {
        
        var titulo = "Felicidades"
        var mensaje = "Respuesta correcta"
        
        if !correcta {
            titulo = "Oh no"
            mensaje = "La respuesta correcta es: " + preguntaActual.correcta
        } else {
            puntos += 20
        }
        
        intentos += 1
        
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: alertHander)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func alertHander(action : UIAlertAction) {
        if intentos < 5 {
            actualizarPregunta()
        } else {
            performSegue(withIdentifier: "condicionalesFinSegue", sender: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "condicionalesFinSegue" {
            
            let viewFinCondicionales = segue.destination as! ViewControllerFinCondicionales
            viewFinCondicionales.pts = puntos
            
        }
    }

}


// MARK: - Pinch2Zoom
extension ViewControllerCondicionales : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagenPregunta
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imagenPregunta.image {
                let ratioW = imagenPregunta.frame.width / image.size.width
                let ratioH = imagenPregunta.frame.height / image.size.height
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                let conditionLeft = newWidth * scrollView.zoomScale > imagenPregunta.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - imagenPregunta.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditionTop = newHeight * scrollView.zoomScale > imagenPregunta.frame.height
                let top = 0.5 * (conditionTop ? newHeight - imagenPregunta.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
