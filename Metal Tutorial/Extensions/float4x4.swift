//
//  simd_float4x4.swift
//  Metal Tutorial
//
//  Created by Keith Sharp on 19/05/2019.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

import simd

extension float4x4 {
    static func createTransformationMatrix(translation: float3, rx: float_t, ry: float_t, rz: float_t, scale: float_t) -> float4x4 {
        
        var radians: Float
        
        // Translation
        var transMatrix = matrix_identity_float4x4
        transMatrix.columns.3.x = translation.x
        transMatrix.columns.3.y = translation.y
        transMatrix.columns.3.z = translation.z
        
        // Rotation X
        var rxMatrix = matrix_identity_float4x4
        radians = rx.degreesToRadians
        rxMatrix.columns.1.y = cos(radians)
        rxMatrix.columns.1.z = sin(radians)
        rxMatrix.columns.2.y = -sin(radians)
        rxMatrix.columns.2.z = cos(radians)
        
        // Rotation Y
        var ryMatrix = matrix_identity_float4x4
        radians = ry.degreesToRadians
        ryMatrix.columns.0.x = cos(radians)
        ryMatrix.columns.0.z = -sin(radians)
        ryMatrix.columns.2.x = sin(radians)
        ryMatrix.columns.2.z = cos(radians)
        
        // Rotation Z
        var rzMatrix = matrix_identity_float4x4
        radians = rz.degreesToRadians
        rzMatrix.columns.0.x = cos(radians)
        rzMatrix.columns.0.y = sin(radians)
        rzMatrix.columns.1.x = -sin(radians)
        rzMatrix.columns.1.y = cos(radians)
        
        // Scaling
        var scaleMatrix = matrix_identity_float4x4
        scaleMatrix.columns.0.x = scale
        scaleMatrix.columns.1.y = scale
        scaleMatrix.columns.2.z = scale
        
        return scaleMatrix * rzMatrix * ryMatrix * rxMatrix * transMatrix
    }
}
