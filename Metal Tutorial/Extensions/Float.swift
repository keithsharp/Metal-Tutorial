//
//  Float.swift
//  Metal Tutorial
//
//  Created by Keith Sharp on 19/05/2019.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

import Foundation

extension Float {
    var radiansToDegrees: Float {
        return (self / Float.pi) * 180
    }
    
    var degreesToRadians: Float {
        return (self /  180) * Float.pi
    }
}
