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
    MTKAssets defines a protocol to store MTKPipelineStateDescriptors
    in a dictionary and make them accessible via the subscript operator.
 
    MTKAssets are supposed to aid the organization of assets belonging to
    a certain group of shaders (e.g. MTKHdrAssets, MTKDenoiseAssets) by
    enabling the user to retrieve all the required assets
    (textures, buffers etc.) through the MTKPipelineStateDescriptor
    by using the subscript operator with the associated function name.
 
    This is used to ease the execution of functions via an execute command
    of an `MTKComputer`:
 
    ```
    let hdrAssets = MTKHdrAssets(args...)
    let hdrComputer = MTKComputer(commandQueue,hdrAssets)
 
    hdrComputer.execute("tonemapping")
    ```
 
    where tonemapping has been initialized inside MTKHdrAssets.
 */
public protocol MTKPAssetDictionary : MTKPDeviceUser, MTKPLibrary {
    var dictionary:Dictionary<String,MTKPPipelineStateDescriptor>? { get set }
    
    subscript(key:String) -> MTKPPipelineStateDescriptor? { get set }
    
    mutating func add(shader:MTKPShader)
}

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
        guard let function = library!.makeFunction(name: shader.name), let device = self.device else {
            fatalError("The _function_ has not been initialized.")
        }
    
        do {
            let computePipelineState = try device.makeComputePipelineState(function: function)
        
            self[shader.name] = MTKPComputePipelineStateDescriptor(
                state:computePipelineState,
                tgSize:shader.tgSize,
                textures:shader.io.fetchTextures(),
                buffers:shader.io.fetchBuffers()
            )
        } catch let error as NSError {
            fatalError("Unexpected error ocurred: \(error.localizedDescription).")
        }
    }
}

public struct MTKPAssets : MTKPAssetDictionary {
    public var dictionary: Dictionary<String, MTKPPipelineStateDescriptor>? = [:]
    public var library: MTLLibrary? = nil
    
    public init() {
        self.init(MTKPShaderLookup.self)
    }
    
    public init(_ lookupClass:AnyClass) {
        guard let device = self.device else {
            fatalError("The _device_ has not been initialized.")
        }
        
        let bundle = Bundle(for: lookupClass)
        guard let library = try? device.makeDefaultLibrary(bundle: bundle) else {
            fatalError("Could not load default library from specified bundle")
        }
        
        self.library = library
    }
}
