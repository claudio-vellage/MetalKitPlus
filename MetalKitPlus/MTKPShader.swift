//
//  MTKFunction.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 05.03.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

public struct MTKPShader {
    internal let tgSize : (Int,Int,Int)
    internal let io : MTKPShaderIO
    internal let name: String
    
    public init(name:String, io:MTKPShaderIO, tgSize:(Int,Int,Int) = (16,16,1)) {
        self.tgSize = tgSize
        self.io = io
        self.name = name
    }
}
