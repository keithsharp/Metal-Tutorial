//
//  Loader.swift
//  Metal Tutorial
//
//  Created by Sharp, Keith on 5/7/19.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

import Metal

class Loader {
    static func createRawModelWithDevice(_ device: MTLDevice, fromVertices vertices: [Vertex], withBufferIndex bufferIndex: Int = 0) -> RawModel {
        guard let vertexBuffer = device.makeBuffer(bytes: vertices, length: vertices.count * MemoryLayout<Vertex>.stride, options: []) else {
            fatalError("Could not create MTLBuffer")
        }
        
        let rawModel = RawModel(vertexBuffer: vertexBuffer, bufferIndex: bufferIndex, count: vertices.count)
        
        return rawModel
    }
}
