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
    public let mtkView:MTKView
    
    public init(view:MTKView, device:MTLDevice = MTKDevice.instance.device!) {
        self.device = device
        
        guard let commandQueue = device.makeCommandQueue() else {
            fatalError("Something went wrong")
        }
        
        self.commandQueue = commandQueue
        view.sampleCount = 4
        view.clearColor = MTLClearColorMake(1, 1, 1, 1)
        view.colorPixelFormat = .bgra8Unorm
        view.depthStencilPixelFormat = .depth32Float
        view.device = device
        
        self.mtkView = view
        
        super.init()
    }
}
