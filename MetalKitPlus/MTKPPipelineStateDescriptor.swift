//
//  MTKPPipelineStateDescriptor.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 27.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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
 * Unified access to tgSize, textures, buffers and samplers.
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
