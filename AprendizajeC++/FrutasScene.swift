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
    var label1 = SKLabelNode()
    var label2 = SKLabelNode()
    var label3 = SKLabelNode()
    
    var fruitThrowTimer = Timer()
    
    var explodeOverlay = SKShapeNode()
    
    override func didMove(to view: SKView) {
        size = CGSize(width: 1242, height: 2208)
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(guardaDatosInterfaz), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        lbPuntos = childNode(withName: "lbPuntos") as! SKLabelNode
        lbPuntos.text = "\(puntos)"
        lbVidas = childNode(withName: "lbVidas") as! SKLabelNode
        lbVidas.text = "\(vidas)"
        
        physicsWorld.gravity = CGVector(dx:0, dy:-2)
        
        explodeOverlay = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        explodeOverlay.fillColor = .white
        addChild(explodeOverlay)
        explodeOverlay.alpha = 0
        
        
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
                    particleEffect(position: node.position)
                    
                } else if node.name == "bomb"{
                    
                    bombExplode()
                    
                    vidas -= 1
                    lbVidas.text = "\(vidas)"
                    node.removeFromParent()
                    particleEffect(position: node.position)
                    
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
        
        label1 = childNode(withName: "lb1") as! SKLabelNode
        label1.text = "Corta las frutas"
        label2 = childNode(withName: "lb2") as! SKLabelNode
        label2.text = "que contengan una"
        label3 = childNode(withName: "lb3") as! SKLabelNode
        label3.text = "palabra reservada"
        
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
                fruit.physicsBody?.velocity.dx = randomCGFloat(0, 50)
            }
            
            if fruit.position.x > size.width/2 {
                fruit.physicsBody?.velocity.dx = randomCGFloat(0, -50)
            }
            
        }
 
        
    }
    
    func missFruit() {
        
    }
    
    func bombExplode() {
        
        for case let fruit as Fruta in children {
            fruit.removeFromParent()
            particleEffect(position: fruit.position)
        }
        
        explodeOverlay.run(SKAction.sequence([
            SKAction.fadeAlpha(to: 1, duration: 0),
            SKAction.wait(forDuration: 0.2),
            SKAction.fadeAlpha(to: 0, duration: 0),
            SKAction.wait(forDuration: 0.2),
            SKAction.fadeAlpha(to: 1, duration: 0),
            SKAction.wait(forDuration: 0.2),
            SKAction.fadeAlpha(to: 0, duration: 0)
        ]))
        
    }
    
    func gameOver() {
        
        gamePhase = .GameOver
        
        fruitThrowTimer.invalidate()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {_ in self.gamePhase = .Ready})
        
        guardaDatosInterfaz()
        
        // segue a fin de juego
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "doaSegue"), object: nil)
        
    }
    
    func particleEffect(position: CGPoint) {
        
        let emitter = SKEmitterNode(fileNamed: "Explode.sks")
        emitter?.position = position
        addChild(emitter!)
    }
    
    @IBAction func guardaDatosInterfaz() {
        
        let defaults = UserDefaults.standard
        defaults.set(puntos, forKey: "puntosFrutitas")
    }

}
