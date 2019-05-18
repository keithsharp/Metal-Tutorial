//
//  Loader.swift
//  Metal Tutorial
//
//  Created by Sharp, Keith on 5/7/19.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

import MetalKit

class Loader {
    
    static func createRawModelWithDevice(_ device: MTLDevice, fromVertices vertices: [Vertex], andIndices indices: [uint16], withBufferIndex bufferIndex: Int = 0) -> RawModel {
        guard let vertexBuffer = device.makeBuffer(bytes: vertices, length: vertices.count * MemoryLayout<Vertex>.stride, options: []) else {
            fatalError("Could not create MTLBuffer")
        }
        
        guard let indexBuffer = device.makeBuffer(bytes: indices, length: indices.count * MemoryLayout<uint>.stride, options: []) else {
            fatalError("Could not create MTLBuffer")
        }
        
        let rawModel = RawModel(vertexBuffer: vertexBuffer, bufferIndex: bufferIndex, indexBuffer: indexBuffer, count: indices.count)
        
        return rawModel
    }
    
    static func createTextureWithDevice(_ device: MTLDevice, fromURL url: URL) -> MTLTexture {

        let textureLoader = MTKTextureLoader(device: device)
        
        // TODO: Add some error handling
        let texture = try! textureLoader.newTexture(URL: url, options: nil)
        
        return texture
    }
}
