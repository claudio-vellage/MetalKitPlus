//
//  MTKShaderAssetsIO.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 14.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

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
