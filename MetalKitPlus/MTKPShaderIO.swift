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
public protocol MTKPShaderIO {
    /// Should handle texture related IO operations.
    func fetchTextures() -> [MTLTexture]?
    
    /// Should handle buffer related IO operations.
    func fetchBuffers() -> [MTLBuffer]?
}

extension MTKPShaderIO where Self : MTKPDeviceUser & MTKPTextureLoader  {
    public init() {
        self.init()
        
        guard let device = self.device else {
            fatalError("The _device_ has not been initialized.")
        }
        
        self.textureLoader = MTKTextureLoader.init(device: device)
    }
}
