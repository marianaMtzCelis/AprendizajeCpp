import Foundation

struct DatosCiclo : Codable {

    var nombre_imagen : String
    var incognitas : [String]
    var respuestas : [String]

    init(nombre_imagen : String, incognitas : [String], respuestas : [String]) {
        self.nombre_imagen = nombre_imagen
        self.incognitas = incognitas
        self.respuestas = respuestas
    }
}
