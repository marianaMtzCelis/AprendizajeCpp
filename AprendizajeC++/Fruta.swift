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
    
    override init() {
        super.init()
        
        var emoji = ""
        
        if randomCGFloat(0, 1) < 0.1 {
            name = "fruit"
            let n = Int(arc4random_uniform(UInt32(fruitEmojis.count)))
            emoji = fruitEmojis[n]
            
        } else {
            name = "bomb"
            emoji = bombEmoji
        }
        
        let label = SKLabelNode(text:emoji)
        label.fontSize = 50
        label.verticalAlignmentMode = .center
        addChild(label)
        
        physicsBody = SKPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
