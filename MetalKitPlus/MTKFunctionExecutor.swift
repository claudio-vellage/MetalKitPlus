//
//  MTKComputer.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 06.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

public protocol MTKFunctionExecutor {
    var commandQueue:MTLCommandQueue { get }
    
    func execute(_ functionName:String)
}
