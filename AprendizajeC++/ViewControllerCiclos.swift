//
//  ViewControllerCiclos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerCiclos: UIViewController, UITextFieldDelegate {

    var listaDatosCiclo : [DatosCiclo]!
    var listaTextBoxIncognitas : [UITextField]!
    var iIncognitas : Int!
    var puntos : Int!
    var intentos : Int!
//    var activeField : UITextField!
    
    @IBOutlet weak var VStackPreguntas: UIStackView!
    @IBOutlet weak var ImagenCiclo: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var botonEvaluar: UIButton!
    
    
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
        
        self.registrarseParaNotificacionesDeTeclado()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        self.view.addGestureRecognizer(tap)
        
        // Setup scrollview
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Se hace aleatorio el orden de las preguntas
        listaDatosCiclo.shuffle()
        
        puntos = 0
        intentos = 0
        actualizarPregunta()
    }
    
    // MARK: - Manipular el teclado
    func registrarseParaNotificacionesDeTeclado() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardDidHideNotification , object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -250 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        activeField = textField
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        activeField = nil
//    }
    
    // MARK: - Mostrar preguntas
    func actualizarPregunta() {
        // Initialize textbox list
        VStackPreguntas.arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
        listaTextBoxIncognitas = [UITextField]()
        mostrarCiclo(indiceCiclo: intentos)
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
    
    // MARK: - Evaluar preguntas
    @IBAction func evaluar(_ sender: UIButton) {
        if (checaBoxesVacio()) {
            let alert = UIAlertController(title: "Error", message: "Alguna de las cajas de texto esta vacia", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        var incorrectas = [String]()
        for i in 0..<iIncognitas {
            let answer = listaTextBoxIncognitas[i].text!
            if (answer.lowercased() != listaDatosCiclo[intentos].respuestas[i]) {
                incorrectas.append(listaDatosCiclo[intentos].incognitas[i])
            }
        }
        
        var titulo = "Felicidades"
        var mensaje = "No tuviste errores"
        
        if !incorrectas.isEmpty {
            titulo = "Oh no"
            mensaje = "Tus errores fueron: "
            incorrectas.forEach { word in
                mensaje.append(word + " ")
            }
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
            performSegue(withIdentifier: "ciclosFinSegue", sender: nil)
        }
    }
    
    // Regresa true si hay una caja con input vacio
    func checaBoxesVacio()-> Bool {
        var b = false
        listaTextBoxIncognitas.forEach { box in
            if box.text == "" {
                b = true
            }
        }
        return b
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ciclosFinSegue" {
            let viewFinCiclos = segue.destination as! ViewControllerFinCiclos
            viewFinCiclos.puntos = puntos
        }
    }
}

// MARK: - Pinch2Zoom
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
