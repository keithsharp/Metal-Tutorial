//
//  ShaderDefinitions.h
//  Metal Tutorial
//
//  Created by Sharp, Keith on 5/7/19.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

#ifndef ShaderDefinitions_h
#define ShaderDefinitions_h

#include <simd/simd.h>

struct Vertex {
    vector_float3 pos;
    vector_float2 uv;
};

struct Uniforms {
    matrix_float4x4 transformationMatrix;
};

#endif /* ShaderDefinitions_h */
