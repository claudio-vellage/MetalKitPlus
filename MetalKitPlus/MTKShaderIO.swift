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
 This class handles IO operations (i.e. texture and buffer allocation)
 on a given `MTLDevice`.
 
 - todo: Move this class to .framework once Apple resolved the segfault bug.
 - requires: `MTLDevice`
 */
open class MTKShaderIO {
    /// Our Textures and Buffers will be stored on this device.
    public let device:MTLDevice
    
    /// Used to load textures for our device.
    public let textureLoader:MTKTextureLoader
    
    /// Should handle texture related IO operations.
    public lazy var fetchTextures: (() -> [MTLTexture]?)? = nil
    
    /// Should handle buffer related IO operations.
    public lazy var fetchBuffers: (() -> [MTLBuffer]?)? = nil
    
    /**
     Constructor
     
     - parameters:
     - device: Device used for IO operations.
     */
    public required init(device:MTLDevice) {
        self.device = device
        self.textureLoader = MTKTextureLoader(device: device)
    }
    
    public convenience init() {
        let device = MTKDevice.instance.device!
        self.init(device: device)
    }
}
