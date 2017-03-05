//
//  MTKComputer.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 13.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

/**
    A `MTKComputer` is used to operate on a given `MTLCommandQueue`.
    
    - note: Should be used subclassed and conform to `MTKFunctionExecutor`
 */
open class MTKComputer {
    public let device:MTLDevice
    public let commandQueue:MTLCommandQueue
    public var assets:MTKAssets
    
    public init(assets:MTKAssets, device:MTLDevice = MTKDevice.instance.device!) {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        self.assets = assets
    }
    
    public lazy var execute: ((String) -> ())? = nil
}
