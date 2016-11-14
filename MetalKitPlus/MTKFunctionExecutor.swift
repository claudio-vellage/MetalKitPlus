//
//  MTKComputer.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 06.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

/**
    This protocol should be used to create an `MTLComputer` that can execute
    shaders.
 
    - requires: `MTLCommandQueue` to create and dispatch `MTLCommandBuffer` objects.
 */
public protocol MTKFunctionExecutor {
    var commandQueue:MTLCommandQueue { get }
    
    /// - parameter functionName: Name of entry in MTKAssets.
    func execute(_ functionName:String)
}
