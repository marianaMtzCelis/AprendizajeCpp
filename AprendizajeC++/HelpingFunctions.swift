//
//  HelpingFunctions.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 11/05/21.
//

import Foundation
import Foundation
import UIKit

func randomCGFloat(_ lowerLimit: CGFloat, _ upperLimit: CGFloat) -> CGFloat {
    return lowerLimit + CGFloat(arc4random()) / CGFloat(UInt32.max) * (upperLimit - lowerLimit)
}
