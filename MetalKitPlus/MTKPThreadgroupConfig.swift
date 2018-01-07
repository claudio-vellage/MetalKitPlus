//
//  MTKPThreadgroupConfig.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 06.01.18.
//  Copyright © 2018 Claudio Vellage. All rights reserved.
//
import Metal

public struct MTKPThreadgroupConfig {
    public let tgSize:MTLSize
    public let tgMemLength:[Int]?
    
    public init(tgSize:(Int,Int,Int) = (16,16,1), tgMemLength:[Int]? = nil) {
        self.tgSize = MTLSizeMake(tgSize.0, tgSize.1, tgSize.2)
        self.tgMemLength = tgMemLength
    }
}
