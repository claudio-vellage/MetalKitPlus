//
//  MTLPipelineStateDescriptor.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 27.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

public struct MTKPPipelineData {
    var tgSize:(Int,Int,Int)?
    var textures:[MTLTexture]?
    var buffers:[MTLBuffer]?
    var samplers:[MTLSamplerState]?
    
    public init(tgSize:(Int,Int,Int),
                textures:[MTLTexture]?,
                buffers:[MTLBuffer]?,
                samplers:[MTLSamplerState]?)
    {
        self.tgSize = tgSize
        self.textures = textures
        self.buffers = buffers
        self.samplers = samplers
    }
}

/**
 * MTKPipelineStateDescriptor defines a protocol for
 * classes that store threadgroup size, textures, buffers
 * and samplers. These MTKPipelineStateDescriptors are
 * supposed to be stored in a dictionary inside MTKAssets.
 */
public protocol MTKPPipelineStateDescriptor {
    var tgSize:(Int,Int,Int)? { get set }
    var textures:[MTLTexture]? { get set }
    var buffers:[MTLBuffer]? { get set }
    var samplers:[MTLSamplerState]? { get set }
    
    var data:MTKPPipelineData? { get set }
    
    init()
}

extension MTKPPipelineStateDescriptor {
    public var tgSize:(Int,Int,Int)? {
        get {
            return data!.tgSize
        }
        set(tgSize) {
            data!.tgSize = tgSize
        }
    }
    
    public var textures:[MTLTexture]? {
        get {
            return data!.textures
        }
        set(textures) {
            data!.textures = textures
        }
    }
    
    public var buffers:[MTLBuffer]? {
        get {
            return data!.buffers
        }
        set(buffers) {
            data!.buffers = buffers
        }
    }
    
    public var samplers:[MTLSamplerState]? {
        get {
            return data!.samplers
        }
        set(samplers) {
            data!.samplers = samplers
        }
    }
    
    public init(tgSize:(Int,Int,Int),
                textures:[MTLTexture]?,
                buffers:[MTLBuffer]?,
                samplers:[MTLSamplerState]?)
    {
        self.init()
        self.data = MTKPPipelineData(tgSize: tgSize, textures: textures, buffers: buffers, samplers: samplers)
    }
                
}

public struct MTKPRenderPipelineStateDescriptor : MTKPPipelineStateDescriptor {
    public init() {}
    
    public var data: MTKPPipelineData? = nil
    
    public private(set) var state:MTLRenderPipelineState? = nil
    public private(set) var depthStencilState:MTLDepthStencilState? = nil
    public private(set) var meshes:[MTKPMeshDescriptor]? = nil
    
    public init (state:MTLRenderPipelineState,
                 tgSize:(Int,Int,Int),
                 depthStencilState:MTLDepthStencilState,
                 textures:[MTLTexture]? = nil,
                 buffers:[MTLBuffer]? = nil,
                 samplers:[MTLSamplerState]? = nil,
                 meshes:[MTKPMeshDescriptor]? = nil
        )
    {
        self.init(tgSize: tgSize, textures: textures, buffers: buffers, samplers: samplers)
        
        self.state = state
        self.depthStencilState = depthStencilState
        self.meshes = meshes
    }
}

public struct MTKPComputePipelineStateDescriptor : MTKPPipelineStateDescriptor {
    public init() {}
    
    public var data: MTKPPipelineData? = nil
    
    public private(set) var state:MTLComputePipelineState? = nil
    
    public init (state:MTLComputePipelineState,
                 tgSize:(Int,Int,Int),
                 textures:[MTLTexture]? = nil,
                 buffers:[MTLBuffer]? = nil,
                 samplers:[MTLSamplerState]? = nil
        )
    {
        self.init(tgSize: tgSize, textures: textures, buffers: buffers, samplers: samplers)
        
        self.state = state
    }
}
