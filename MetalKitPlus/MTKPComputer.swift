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
public struct MTKPComputer : MTKPCommandQueue {
    var assets:MTKPAssets
    
    public init(assets:MTKPAssets) {
        self.assets = assets
    }
}

public protocol MTKPShaderExecutor {
    func execute(_ name:String)
}
