//
//  MTKFunctionArrayExecutor.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 13.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

protocol MTKFunctionArrayExecutor : MTKFunctionExecutor {
    func execute(_ functionName:[String])
}
