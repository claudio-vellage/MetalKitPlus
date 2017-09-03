//
//  MTKPCommandQueueUser.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 03.09.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import Metal

private var queue:MTLCommandQueue! = nil

public protocol MTKPCommandQueue : MTKPDeviceUser {
    var commandQueue:MTLCommandQueue! { get }
}

extension MTKPCommandQueue {
    public var commandQueue:MTLCommandQueue! {
        return queue
    }
    
    public init() {
        self.init()
        
        guard let device = self.device, let commandQueue = device.makeCommandQueue() else {
            fatalError("CommandQueue not initialzied" )
        }
        
        queue = commandQueue
    }
}
