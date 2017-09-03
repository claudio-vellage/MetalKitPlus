//
//  MTKPTestLib.metal
//  MTKPTestLib
//
//  Created by Claudio Vellage on 03.09.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void toGray(texture2d<float, access::read> inTexture [[texture(0)]],
                   texture2d<float, access::write> outTexture [[texture(1)]],
                   uint2 gid [[thread_position_in_grid]])
{
    float4 inColor = inTexture.read(gid);
    float value = dot(inColor.rgb, float3(0.299, 0.587, 0.114));
    float4 grayColor(value, value, value, 1.0);
    float4 outColor = grayColor;
    outTexture.write(outColor, gid);
}
