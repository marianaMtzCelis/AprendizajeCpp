//
//  ViewControllerTiposDeDatos.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerTiposDeDatos: UIViewController {

    @IBOutlet weak var labelInstruccion: UILabel!
    var listaDatosGlobo : [DatosGlobo]!
    var listaTiposDeDatos : [String]!
    var timerJuego : Timer?
    var tipoDeDatoPartida : String = ""
    var puntos : Int!
    var vidas : Int!
    
    @IBOutlet weak var labelPuntos: UILabel!
    @IBOutlet weak var labelVidas: UILabel!
    @IBOutlet weak var tituloJuego: UILabel!
    
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
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapBalloon)))
        
        let defaults = UserDefaults.standard
        if let dispositivo = defaults.value(forKey: "dispositivo") as? String {
            if dispositivo == "ipad" {
                labelPuntos.font = labelPuntos.font.withSize(25)
                labelVidas.font = labelVidas.font.withSize(25)
                tituloJuego.font = tituloJuego.font.withSize(40)
                labelInstruccion.font = labelInstruccion.font.withSize(30)
            }
            else if dispositivo == "ipod" {
                labelPuntos.font = labelPuntos.font.withSize(12)
                labelVidas.font = labelVidas.font.withSize(12)
                tituloJuego.font = tituloJuego.font.withSize(30)
                labelInstruccion.font = labelInstruccion.font.withSize(20)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipoDeDatoPartida = listaTiposDeDatos.randomElement()!
        tituloJuego.text = tipoDeDatoPartida.uppercased()
        puntos = 0
        vidas = 3
        labelPuntos.text = "Puntos: " + String(puntos)
        labelVidas.text = "Vidas: " + String(vidas)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createBalloons()
        timerJuego = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(createBalloons), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dissapearAllBalloons()
        timerJuego?.invalidate()
    }
    
    @objc fileprivate func dissapearAllBalloons() {
        for v in view.subviews {
            if let balloonImageView = v as? UIImageView {
                balloonImageView.removeFromSuperview()
            }
        }
    }
    
    @objc fileprivate func createBalloons() {
        var i = 1
        let xOffset = view.frame.width / 5
        let globosRandom = [DatosGlobo](listaDatosGlobo.shuffled()[0..<5])
        globosRandom.forEach { (balloonData) in
            let balloonImage = UIImage(named: balloonData.nombre_imagen)
            let balloonImageView = UIImageView(image: balloonImage)
            balloonImageView.accessibilityLabel = balloonData.tipo
            balloonImageView.frame = CGRect(x: i, y: Int(view.frame.height), width: 100, height: 150)
            balloonImageView.contentMode = .scaleAspectFit
            view.addSubview(balloonImageView)
            i += Int(xOffset)
            animateBalloon(balloonImageView: balloonImageView)
        }
    }
    
    fileprivate func animateBalloon(balloonImageView: UIImageView) {
        let delay = Int.random(in: 0..<6000)
        
        // Arreglar : no desaparacen los globos, solo salen del frame
        UIView.animate(withDuration: 10, delay: Double(delay) / 1000, animations: {
            balloonImageView.center.y = -100
        })
    }
    
    @objc fileprivate func handleTapBalloon(gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: self.view)
        
        for v in view.subviews {
            guard let balloonLocation = v.layer.presentation()?.frame else {return}
            
            if balloonLocation.contains(location) {
                if let balloonImageView = v as? UIImageView {
                    balloonPop(balloonImageView: balloonImageView)
                }
            }
        }
    }
    
    fileprivate func balloonPop(balloonImageView: UIImageView) {
        
        if balloonImageView.accessibilityLabel == tipoDeDatoPartida {
            incrementarPuntos()
        } else {
            quitarVida()
        }
        
        balloonImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: .allowUserInteraction, animations: {
            balloonImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
        }) { (_) in
            balloonImageView.removeFromSuperview()
        }
    }
    
    func incrementarPuntos() {
        puntos += 1
        labelPuntos.text = "Puntos: " + String(puntos)
    }
    
    func quitarVida() {
        vidas -= 1
        labelVidas.text = "Vidas: " + String(vidas)
        if ( vidas == 0 ){
            performSegue(withIdentifier: "globosFinSegue", sender: nil)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "globosFinSegue" {
            
            let viewFinGlobos = segue.destination as! ViewControllerFinTiposDeDatos
            viewFinGlobos.pts = puntos
            
        }
    }

}
