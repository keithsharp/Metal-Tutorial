//
//  Renderer.swift
//  Metal Tutorial
//
//  Created by Sharp, Keith on 5/7/19.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

import MetalKit

class Renderer: NSObject {
    
    let device: MTLDevice
    let commandQueue: MTLCommandQueue
    
    init?(mtkView: MTKView) {
        device = mtkView.device!
        guard let tmpCommandQueue = device.makeCommandQueue() else {
            return nil
        }
        commandQueue = tmpCommandQueue
    }
    
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {

    }
}
