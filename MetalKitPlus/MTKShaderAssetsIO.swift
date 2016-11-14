//
//  MTKShaderAssetsIO.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 14.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal
import MetalKit

/*
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * As of now, a segfault occurs when trying to subclass
 * this class in a project. To resolve this problem
 * simply copy this file over to your project.
 * Let's hope, Apple will try and resolve this bug.
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */

open class MTKShaderAssetsIO {
    public let device:MTLDevice
    public let textureLoader:MTKTextureLoader
    
    open lazy var fetchTextures: (() -> [MTLTexture]?)? = nil
    open lazy var fetchBuffers: (() -> [MTLBuffer]?)? = nil
    
    public init(device:MTLDevice) {
        self.device = device
        self.textureLoader = MTKTextureLoader(device: device)
    }
}
