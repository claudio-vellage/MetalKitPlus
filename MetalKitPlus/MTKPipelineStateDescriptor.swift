//
//  MTLPipelineStateDescriptor.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 27.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

/*
 * MTKPipelineStateDescriptor defines a protocol for
 * classes that store threadgroup size, textures, buffers
 * and samplers. These MTKPipelineStateDescriptors are
 * supposed to be stored in a dictionary inside MTKAssets.
 */

public protocol MTKPipelineStateDescriptor {
    var tgSize:(Int,Int,Int) { get }
    var textures:[MTLTexture]? { get }
    var buffers:[MTLBuffer]? { get }
    var samplers:[MTLSamplerState]? { get }
}
