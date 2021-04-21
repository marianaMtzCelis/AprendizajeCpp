import Foundation

struct DatosGlobo : Codable {

    var tipo : String
    var nombre_imagen : String

    init(tipo : String, nombre_imagen : String) {
        self.tipo = tipo
        self.nombre_imagen = nombre_imagen
    }
}
