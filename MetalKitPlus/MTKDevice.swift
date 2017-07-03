//
//  MTKDevice.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 03.03.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import Metal

private let _instance = MTKDevice()

@_versioned
class MTKDevice {
    public let device = MTLCreateSystemDefaultDevice()
    
    public class var instance : MTKDevice {
        return _instance
    }
}
