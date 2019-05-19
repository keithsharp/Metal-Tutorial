//
//  Shaders.metal
//  Metal Tutorial
//
//  Created by Sharp, Keith on 5/7/19.
//  Copyright © 2019 Passback Systems. All rights reserved.
//

#include <metal_stdlib>
#include "ShaderDefinitions.h"
using namespace metal;

struct VertexOut {
    float4 pos [[position]];
    float2 uv;
};

vertex VertexOut vertex_main(const device Vertex *vertexArray [[buffer(0)]],
                             unsigned int vid [[vertex_id]],
                             constant Uniforms &uniforms [[buffer(1)]])
{
    Vertex in = vertexArray[vid];
    
    VertexOut out;
    out.pos = float4(in.pos.x, in.pos.y, in.pos.z, 1);
    out.uv = in.uv;
    
    return out;
}

fragment float4 fragment_main(VertexOut in [[stage_in]],
                              texture2d<float> myTexture [[texture(0)]],
                              constant Uniforms &uniforms [[buffer(1)]])
{
    constexpr sampler textureSampler;
    float3 colour = myTexture.sample(textureSampler, in.uv).rgb;
    
    return float4(colour, 1);
}
