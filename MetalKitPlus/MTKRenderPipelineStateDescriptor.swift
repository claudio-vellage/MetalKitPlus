//
//  MTKRenderPipelineStateDescriptor.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 04.09.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

struct MTKRenderPipelineStateDescriptor : MTKPipelineStateDescriptor {
    let state:MTLRenderPipelineState
    let tgSize:(Int, Int, Int)
    let depthStencilState:MTLDepthStencilState
    let textures:[MTLTexture]?
    let buffers:[MTLBuffer]?
    let samplers:[MTLSamplerState]?
    let meshes:[MTKMeshDescriptor]?
    
    init (state:MTLRenderPipelineState,
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
