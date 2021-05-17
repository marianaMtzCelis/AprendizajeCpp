//
//  Fruta.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 11/05/21.
//

import Foundation
import SpriteKit

class Fruta: SKNode {
    
    let fruitEmojis = ["🍎", "🍉", "🍓", "🥝", "🍍", "🍊"]
    let bombEmoji = "💣"
    
    // var listaDatosFrutas : [DatosFruta]!
    
    var listaFrutas = ["appleSi1", "appleSi2", "appleSi3", "bananaSi1", "bananaSi2", "bananaSi3", "coconutSi1", "coconutSi2", "coconutSi3", "orangeSi1", "orangeSi2", "orangeSi3", "pineappleSi1", "pineappleSi2", "pineappleSi3", "watermelonSi1", "watermelonSi2", "watermelonSi3"]
    
    var listaBombas = ["appleNo1", "appleNo2", "appleNo3", "bananaNo1", "bananaNo2", "bananaNo3", "coconutNo1", "coconutNo2", "coconutNo3", "orangeNo1", "orangeNo2", "orangeNo3", "pineappleNo1", "pineappleNo2", "pineappleNo3", "watermelonNo1", "watermelonNo2", "watermelonNo3"]
    
    override init() {
        super.init()
        
        /*
        // Load fruit data (list of DatosFruta)
        let rutaDatosFruta = Bundle.main.path(forResource: "listaPalabras", ofType: "json")!

        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: rutaDatosFruta))
            listaDatosFrutas = try JSONDecoder().decode([DatosFruta].self, from: data)
        } catch {
            print("Error al cargar el archivo listaValores.json")
        }
        
        for el in listaDatosFrutas {
            if el.isReserved {
                print("si")
                listaFrutas.append(el)
            } else {
                listaBombas.append(el)
            }
        }
         */
        
        var photo : SKTexture
        
        if randomCGFloat(0, 1) < 0.5 {
            name = "fruit"
            let n = Int(arc4random_uniform(UInt32(listaFrutas.count)))
            photo = SKTexture(imageNamed: listaFrutas[n])
      
        } else {
            name = "bomb"
            let n = Int(arc4random_uniform(UInt32(listaBombas.count)))
            photo = SKTexture(imageNamed: listaBombas[n])
        }
        
        let img = SKSpriteNode(texture: photo)
        img.size = CGSize(width: 100, height: 100)
        addChild(img)
        
        physicsBody = SKPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
