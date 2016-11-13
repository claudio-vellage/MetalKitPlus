//
//  MTKComputer.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 13.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

open class MTKComputer {
    public let commandQueue:MTLCommandQueue
    
    public init(commandQueue:MTLCommandQueue) {
        self.commandQueue = commandQueue
    }
}
