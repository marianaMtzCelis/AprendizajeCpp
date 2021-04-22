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
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapBalloon)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Create balloons
        createBalloons()
    }
    
    fileprivate func createBalloons() {
        var i = 1
        listaDatosGlobo.forEach { (balloonData) in
            let balloonImage = UIImage(named: balloonData.nombre_imagen)
            let balloonImageView = UIImageView(image: balloonImage)
            balloonImageView.frame = CGRect(x: i, y: Int(view.frame.height), width: 50, height: 75)
            balloonImageView.contentMode = .scaleAspectFit
            view.addSubview(balloonImageView)
            i += 72
            animateBalloon(balloonImageView: balloonImageView)
        }
    }
    
    fileprivate func animateBalloon(balloonImageView: UIImageView) {
        let delay = Int.random(in: 0..<6)
        
        UIView.animate(withDuration: 20, delay: Double(delay), animations: {
            balloonImageView.center.y = -50
        })
    }
    
    @objc fileprivate func handleTapBalloon(gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: self.view)
        
        for v in view.subviews {
            guard let balloonLocation = v.layer.presentation()?.frame else {return}
            
            if balloonLocation.contains(location) {
                let balloonImageView = v as! UIImageView;
                balloonPop(balloonImageView: balloonImageView)
            }
        }
    }
    
    fileprivate func balloonPop(balloonImageView: UIImageView) {
        balloonImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: .allowUserInteraction, animations: {
            balloonImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
        }) { (_) in
            balloonImageView.alpha = 0
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "globosFinSegue" {
            
            let viewFinGlobos = segue.destination as! ViewControllerFinTiposDeDatos
            
        }
    }

}
