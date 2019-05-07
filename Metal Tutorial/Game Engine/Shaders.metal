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
};

vertex VertexOut vertex_main(const device Vertex *vertexArray [[buffer(0)]], unsigned int vid [[vertex_id]])
{
    Vertex in = vertexArray[vid];
    
    VertexOut out;
    out.pos = float4(in.pos.x, in.pos.y, in.pos.z, 1);
    
    return out;
}

fragment half4 fragment_main(VertexOut in [[stage_in]])
{
    return half4(1, 1, 1, 1);
}
