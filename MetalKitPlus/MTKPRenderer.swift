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
public struct MTKPRenderer : MTKPDeviceUser {
    public private(set) var commandQueue:MTLCommandQueue! = nil
    public private(set) var mtkView:MTKView! = nil
    
    public init(view:MTKView) {
        guard let device = self.device, let commandQueue = device.makeCommandQueue() else {
            fatalError("Something went wrong")
        }
        
        self.commandQueue = commandQueue
        view.sampleCount = 4
        view.clearColor = MTLClearColorMake(1, 1, 1, 1)
        view.colorPixelFormat = .bgra8Unorm
        view.depthStencilPixelFormat = .depth32Float
        view.device = device
        
        self.mtkView = view
    }
}
