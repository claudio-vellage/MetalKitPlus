//
//  MTKFunction.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 05.03.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

open class MTKShader {
    public let tgSize : (Int,Int,Int)
    public let io : MTKShaderIO
    public let name: String
    
    public init(name:String, io:MTKShaderIO, tgSize:(Int,Int,Int) = (16,16,1)) {
        self.tgSize = tgSize
        self.io = io
        self.name = name
    }
}
