//
//  MTKDevice.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 03.03.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import Metal

private let _instance = MTKPDevice()

fileprivate class MTKPDevice {
    public let device = MTLCreateSystemDefaultDevice()
    
    public class var instance : MTKPDevice {
        return _instance
    }
}

public protocol MTKPDeviceUser {
    var device:MTLDevice? { get }
}

extension MTKPDeviceUser {
    public var device:MTLDevice? {
        return MTKPDevice.instance.device
    }
}
