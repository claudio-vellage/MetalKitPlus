//
//  MTKComputer.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 13.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

class MTKComputer {
    private let commandQueue:MTLCommandQueue
    
    required init(commandQueue:MTLCommandQueue) {
        self.commandQueue = commandQueue
    }
}
