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
    half3 colour;
};

vertex VertexOut vertex_main(const device Vertex *vertexArray [[buffer(0)]], unsigned int vid [[vertex_id]])
{
    Vertex in = vertexArray[vid];
    
    VertexOut out;
    out.pos = float4(in.pos.x, in.pos.y, in.pos.z, 1);
    out.colour = half3(in.pos.x + 0.5, 1.0, in.pos.y + 0.5);
    
    return out;
}

fragment half4 fragment_main(VertexOut in [[stage_in]])
{
    return half4(in.colour, 1);
}
