//
//  MTKPAssetLoader.swift
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

/**
 * MTKPAssets organizes MTKPPipelineStateDescriptors along with the Metal library.
 *
 * All resources that are relevant for a shader can be retrieved by using the subscript
 * operator:
 *
 * ```
 * let pipelineStateDescriptor = assets["myShader"]
 * ```
 *
 * You usually want to retrieve the stateDescriptors prior to encoding your Metal command.
 */

public struct MTKPAssets : MTKPAssetDictionary {
    public var dictionary: Dictionary<String, MTKPPipelineStateDescriptor>? = [:]
    public var library: MTLLibrary? = nil
    
    public init() {
        self.init(MTKPShaderLookup.self)
    }
    
    public init(_ lookupClass:AnyClass) {
        let bundle = Bundle(for: lookupClass)
        
        guard let library = try? MTKPDevice.instance.device.makeDefaultLibrary(bundle: bundle) else {
            fatalError("Could not load default library from specified bundle")
        }
        
        self.library = library
    }
}

/**
 * Every MTKPAssetDictionary uses a Metal device and library to compile the shaders.
 */

public protocol MTKPAssetDictionary : MTKPLibraryUser {
    var dictionary:Dictionary<String,MTKPPipelineStateDescriptor>? { get set }
    
    subscript(key:String) -> MTKPPipelineStateDescriptor? { get set }
    
    mutating func add(shader:MTKPShader)
}

/**
 * This extension provides a default implementation to add functions to the
 * assets.
 */

public extension MTKPAssetDictionary {
    public subscript(key:String) -> MTKPPipelineStateDescriptor? {
        get {
            return dictionary![key]
        }
    
        set(pipelineStateDescriptor) {
            dictionary![key] = pipelineStateDescriptor
        }
    }

    public mutating func add(shader:MTKPShader) {
        guard let function = library!.makeFunction(name: shader.name) else {
            fatalError("The _function_ has not been initialized.")
        }
    
        do {
            let computePipelineState = try MTKPDevice.instance.device.makeComputePipelineState(function: function)
            
            self[shader.name] = MTKPComputePipelineStateDescriptor(
                state:computePipelineState,
                textures:shader.io.fetchTextures(),
                buffers:shader.io.fetchBuffers()
            )
        } catch let error as NSError {
            fatalError("Unexpected error ocurred: \(error.localizedDescription).")
        }
    }
}

/**
 * All structs that need access to assets, should conform to this protocol.
 */

public protocol MTKPAssetUser {
    var assets:MTKPAssets { get }
}
