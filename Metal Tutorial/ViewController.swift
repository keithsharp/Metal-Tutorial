//
//  ViewController.swift
//  Metal Tutorial
//
//  Created by Keith Sharp on 02/05/2019.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

import Cocoa
import MetalKit

class ViewController: NSViewController {

    var mtkView: MTKView!
    var renderer: Renderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tmpMtkView = self.view as? MTKView else {
            fatalError("Could not downcast view to MTKView")
        }
        mtkView = tmpMtkView
        
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {
            fatalError("Could not create default Metal device")
        }
        mtkView.device = defaultDevice
        
        guard let tmpRenderer = Renderer(mtkView: self.mtkView) else {
            fatalError("Could not initialise Renderer class")
        }
        renderer = tmpRenderer
        mtkView.delegate = renderer

        let vertices = [Vertex(pos: [-0.5, 0.5, 0], uv: [0, 0]),
                        Vertex(pos: [0.5, -0.5, 0], uv: [1, 1]),
                        Vertex(pos: [-0.5, -0.5, 0], uv: [0, 1]),
                        Vertex(pos: [0.5, 0.5, 0], uv: [1, 0])]
        
        let indices: [uint16] = [0, 1, 2, 0, 3, 1]

        let model = Loader.createRawModelWithDevice(defaultDevice, fromVertices: vertices, andIndices: indices)
        
        guard let url = Bundle.main.url(forResource: "texture", withExtension: "png") else {
            fatalError("Could not load texture from main bundle.")
        }
        let texture = Loader.createTextureWithDevice(defaultDevice, fromURL: url)
        renderer.texturedModel = TexturedModel(rawModel: model, texture: texture)
        
        
    }

}
