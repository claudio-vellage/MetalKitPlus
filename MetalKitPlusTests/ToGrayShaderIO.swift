//
//  toGreyShaderIO.swift
//  MetalKitPlusTests
//
//  Created by Philipp Waxweiler on 29.01.18.
//  Copyright © 2018 Claudio Vellage. All rights reserved.
//

import MetalKit
import MetalKitPlus

final class ToGrayShaderIO : MTKPIOProvider {
    
    private let inTexture:MTLTexture
    private let outTexture:MTLTexture
    
    init(){
        let descriptor = MTLTextureDescriptor()
        descriptor.width = 256
        descriptor.height = 256
        descriptor.textureType = .type2D
        descriptor.pixelFormat = .rgba8Unorm
        descriptor.storageMode = .private
        descriptor.usage = .unknown
        
        guard let inTexture = MTKPDevice.instance.makeTexture(descriptor: descriptor) else {
            fatalError("Texture could not be made.")
        }
        guard let outTexture = MTKPDevice.instance.makeTexture(descriptor: descriptor) else {
            fatalError("Texture could not be made.")
        }
        
        self.inTexture = inTexture
        self.outTexture = outTexture
    }
    
    func fetchTextures() -> [MTLTexture?]? {
        return [inTexture, outTexture]
    }
    
    func fetchBuffers() -> [MTLBuffer]? {
        return nil
    }
}
