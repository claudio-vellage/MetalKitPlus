//
//  MTKRenderPipelineStateDescriptor.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 04.09.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

public struct MTKRenderPipelineStateDescriptor : MTKPipelineStateDescriptor {
    public let state:MTLRenderPipelineState
    public let tgSize:(Int, Int, Int)
    public let depthStencilState:MTLDepthStencilState
    public let textures:[MTLTexture]?
    public let buffers:[MTLBuffer]?
    public let samplers:[MTLSamplerState]?
    public let meshes:[MTKMeshDescriptor]?
    
    public init (state:MTLRenderPipelineState,
          tgSize:(Int,Int,Int),
          depthStencilState:MTLDepthStencilState,
          textures:[MTLTexture]? = nil,
          buffers:[MTLBuffer]? = nil,
          samplers:[MTLSamplerState]? = nil,
          meshes:[MTKMeshDescriptor]? = nil
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
