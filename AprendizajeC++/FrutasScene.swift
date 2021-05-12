//
//  FrutasScene.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 11/05/21.
//

import UIKit
import SpriteKit

enum GamePhase {
    case Ready
    case InPlay
    case GameOver
}

class FrutasScene: SKScene {
    
    var gamePhase = GamePhase.Ready
    var puntos = 0
    var vidas = 3
    
    var lbPuntos = SKLabelNode()
    var lbVidas = SKLabelNode()
    
    var fruitThrowTimer = Timer()
    
    override func didMove(to view: SKView) {
        
        lbPuntos = childNode(withName: "lbPuntos") as! SKLabelNode
        lbPuntos.text = "\(puntos)"
        lbVidas = childNode(withName: "lbVidas") as! SKLabelNode
        lbVidas.text = "\(vidas)"
        
        physicsWorld.gravity = CGVector(dx:0, dy:-2)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gamePhase == .Ready {
            gamePhase = .InPlay
            startGame()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let location = t.location(in: self)
            
            for node in nodes(at:location) {
                
                if node.name == "fruit" {
                    puntos += 1
                    lbPuntos.text = "\(puntos)"
                    node.removeFromParent()
                    
                } else if node.name == "bomb"{
                    
                    vidas -= 1
                    lbVidas.text = "\(vidas)"
                    node.removeFromParent()
                    
                    if (vidas < 1) {
                        gameOver()
                    }
                }
            }
        }
    }
    
    override func didSimulatePhysics() {
        
    }
    
    func startGame() {
        
        puntos = 0
        vidas = 3
        lbPuntos.text = "\(puntos)"
        lbVidas.text = "\(vidas)"
        
        fruitThrowTimer = Timer.scheduledTimer(withTimeInterval:3.0, repeats: true, block: {_ in self.createFruits()})
        
    }
    
    func createFruits() {
        
        print("fruits")
        
        let numberOfFruits = 1 + Int(arc4random_uniform(UInt32(4)))
        
        for _ in 0..<numberOfFruits {
            
            let fruit = Fruta()
            
            fruit.position.x = randomCGFloat(5, 300)
            fruit.position.y = -100
            addChild(fruit)
            fruit.zPosition = 1
           
            fruit.physicsBody?.velocity.dy = randomCGFloat(500, 800)
            fruit.physicsBody?.angularVelocity = randomCGFloat(-5, 5)
            
            if fruit.position.x < size.width/2 {
                fruit.physicsBody?.velocity.dx = randomCGFloat(0, 200)
            }
            
            if fruit.position.x > size.width/2 {
                fruit.physicsBody?.velocity.dx = randomCGFloat(0, -200)
            }
            
        }
 
        
    }
    
    func missFruit() {
        
    }
    
    func bombExplode() {
        
    }
    
    func gameOver() {
        
        gamePhase = .GameOver
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {_ in self.gamePhase = .Ready})
        // segue a fin de juego
        
        
    }

}
