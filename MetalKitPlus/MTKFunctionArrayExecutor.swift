//
//  MTKFunctionArrayExecutor.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 13.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

/**
    This protocol should be used to create an `MTLComputer` that can execute
    one or multiple shaders.

 */
public protocol MTKFunctionArrayExecutor : MTKFunctionExecutor {
    
    /// - parameter functionName: List of names of entries in MTKAssets.
    func execute(_ functionName:[String])
}
