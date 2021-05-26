//
//  DatosCondicionales.swift
//  AprendizajeC++
//
//  Created by Mariano Shaar on 25/05/21.
//

import Foundation

struct DatosCondicionales : Codable {

    var nombre_imagen : String
    var respuestas : [String]
    var correcta : String

    init(nombre_imagen : String, respuestas : [String], correcta : String) {
        self.nombre_imagen = nombre_imagen
        self.respuestas = respuestas
        self.correcta = correcta
    }
}
