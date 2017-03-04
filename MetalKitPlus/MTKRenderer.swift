//
//  MTKRenderer.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 28.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import MetalKit

/**
 * All renderers must be delegates of an MTKView.
 */
open class MTKRenderer : NSObject {
    public let device:MTLDevice
    public let commandQueue:MTLCommandQueue
    
    public init(device:MTLDevice = MTKDevice.instance.device!) {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        super.init()
    }
}
