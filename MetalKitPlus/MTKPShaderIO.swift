//
//  MTKPShaderAssetsIO.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 14.11.16.
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
import MetalKit

/**
 This protocol defines which functions are required to perform IO operations
 (i.e. texture and buffer allocation) on a given `MTLDevice`.
 
 - requires: `MTLDevice`
 */
public protocol MTKPTextureLoader {
    func fetchTextures() -> [MTLTexture]?
}

public protocol MTKPBufferLoader {
    func fetchBuffers() -> [MTLBuffer]?
}

public protocol MTKPIOProvider : MTKPTextureLoader, MTKPBufferLoader {}

open class MTKPShaderIO : MTKPDeviceUser {
    private(set) var textureLoader:MTKTextureLoader? = nil
    
    public init() {
        guard let device = self.device else {
            fatalError("The _device_ has not been initialized.")
        }
        
        self.textureLoader = MTKTextureLoader.init(device: device)
    }
}