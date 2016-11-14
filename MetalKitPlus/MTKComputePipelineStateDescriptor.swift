//
//  MTKComputePipelineStateDescriptor.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 04.09.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

/**
    Bundles all resources for shader kernels.
 */
public struct MTKComputePipelineStateDescriptor : MTKPipelineStateDescriptor {
    public let state:MTLComputePipelineState
    public let tgSize:(Int,Int,Int)
    public let textures:[MTLTexture]?
    public let buffers:[MTLBuffer]?
    public let samplers:[MTLSamplerState]?
    
    public init (state:MTLComputePipelineState, tgSize:(Int,Int,Int) , textures:[MTLTexture]? = nil, buffers:[MTLBuffer]? = nil, samplers:[MTLSamplerState]? = nil) {
        self.state = state
        self.tgSize = tgSize
        self.textures = textures
        self.buffers = buffers
        self.samplers = samplers
    }
}
