//
//  MTKPComputerTest.swift
//  MetalKitPlusTests
//
//  Created by Claudio Vellage on 28.12.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import XCTest

struct ToGrayIOProvider : MTKPIOProvider {
    
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

struct MTKPTestComputer : MTKPComputer {
    let assets:MTKPAssets
    
    init(assets:MTKPAssets) {
        self.assets = assets
    }
}

class MTKPComputerTest : XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        let assets = MTKPAssets()
        
        MTKPTestComputer(assets: assets)
        
        // TODO: Add an assert here, think about some good assertions
    }
    
    func testEncodeFunction() {
        var assets = MTKPAssets()
        assets.add(shader: MTKPShader(name: "toGray", io: ToGrayIOProvider()))
        
        let computer = MTKPTestComputer(assets: assets)
        computer.encode("toGray")
        
        // TODO: Add an assert here, preferably verify the results of the shader
    }
}
