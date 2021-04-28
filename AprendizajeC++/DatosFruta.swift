import Foundation

struct DatosFruta : Codable {

    var isReserved : Bool
    var nombre_imagen : String

    init(isReserved : Bool, nombre_imagen : String) {
        self.isReserved = isReserved
        self.nombre_imagen = nombre_imagen
    }
}
