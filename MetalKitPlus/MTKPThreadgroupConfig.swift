//
//  MTKPThreadgroupConfig.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 06.01.18.
//  Copyright © 2018 Claudio Vellage. All rights reserved.
//

public struct MTKPThreadgroupConfig {
    internal let tgSize:(Int,Int,Int)
    internal let tgMemLength:[Int]?
    
    public init(tgSize:(Int,Int,Int) = (16,16,1), tgMemLength:[Int]? = nil) {
        self.tgSize = tgSize
        self.tgMemLength = tgMemLength
    }
}
