//
//  MTLPipelineStateDescriptor.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 27.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

/**
 * MTKPipelineStateDescriptor defines a protocol for
 * classes that store threadgroup size, textures, buffers
 * and samplers. These MTKPipelineStateDescriptors are
 * supposed to be stored in a dictionary inside MTKAssets.
 */
public protocol MTKPPipelineStateDescriptor {
    var tgSize:(Int,Int,Int) { get set }
    var textures:[MTLTexture]? { get set }
    var buffers:[MTLBuffer]? { get set }
    var samplers:[MTLSamplerState]? { get set }
}

public struct MTKPRenderPipelineStateDescriptor : MTKPPipelineStateDescriptor {
    public var textures:[MTLTexture]?
    public var buffers:[MTLBuffer]?
    public var samplers:[MTLSamplerState]?
    public var tgSize:(Int, Int, Int)
    
    public let state:MTLRenderPipelineState
    public let depthStencilState:MTLDepthStencilState
    public let meshes:[MTKPMeshDescriptor]?
    
    public init (state:MTLRenderPipelineState,
                 tgSize:(Int,Int,Int),
                 depthStencilState:MTLDepthStencilState,
                 textures:[MTLTexture]? = nil,
                 buffers:[MTLBuffer]? = nil,
                 samplers:[MTLSamplerState]? = nil,
                 meshes:[MTKPMeshDescriptor]? = nil
        )
    {
        self.state = state
        self.tgSize = tgSize
        self.depthStencilState = depthStencilState
        self.textures = textures
        self.buffers = buffers
        self.samplers = samplers
        self.meshes = meshes
    }
}

public struct MTKPComputePipelineStateDescriptor : MTKPPipelineStateDescriptor {
    public var tgSize:(Int,Int,Int)
    public var textures:[MTLTexture]?
    public var buffers:[MTLBuffer]?
    public var samplers:[MTLSamplerState]?
    
    public let state:MTLComputePipelineState
    
    public init (state:MTLComputePipelineState,
                 tgSize:(Int,Int,Int),
                 textures:[MTLTexture]? = nil,
                 buffers:[MTLBuffer]? = nil,
                 samplers:[MTLSamplerState]? = nil
        )
    {
        self.state = state
        self.tgSize = tgSize
        self.textures = textures
        self.buffers = buffers
        self.samplers = samplers
    }
}
