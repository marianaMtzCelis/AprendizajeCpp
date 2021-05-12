import Foundation

struct DatosCiclo : Codable {

    var nombre_imagen : String
    var respuestas : [String]

    init(nombre_imagen : String, respuestas : [String]) {
        self.nombre_imagen = nombre_imagen
        self.respuestas = respuestas
    }
}
