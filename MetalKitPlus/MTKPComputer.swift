//
//  MTKPComputer.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 27.12.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Metal

/**
 * An MTKPComputer allows the user to encode shaders for a given command queue.
 *
 * Note: encode() and dispatch() have been moved from MTKPShaderEncoder directly
 * to MTKPComputer, because MTKPShaderEncoder has only been used by MTKPComputer.
 * This change could be reverted in later releases, but for now I've opted for the
 * simpler design.
 */

public protocol MTKPComputer {
    func encode(_ name:String)
    func dispatch(using commandEncoder:MTLComputeCommandEncoder, stateDescriptor:MTKPComputePipelineStateDescriptor)
    var assets:MTKPAssets { get }
}

/**
 * Default implementation for a simple image processing computer.
 */

public extension MTKPComputer {
    func encode(_ name: String) {
        guard
            let commandBuffer = MTKPDevice.commandQueue.makeCommandBuffer(),
            let commandEncoder = commandBuffer.makeComputeCommandEncoder() else {
                // TODO: Insert proper error message here.
                fatalError()
        }
        
        guard let stateDescriptor = assets[name] as? MTKPComputePipelineStateDescriptor else {
                // TODO: Insert proper error message here.
                fatalError()
        }
        
        guard let pipelineState = stateDescriptor.state else {
                // TODO: Insert proper error message here.
                fatalError()
        }
        
        commandEncoder.pushDebugGroup(name)
        commandEncoder.setComputePipelineState(pipelineState)
        
        if let textures = stateDescriptor.textures { commandEncoder.encode(textures) }
        if let buffers = stateDescriptor.buffers { commandEncoder.encode(buffers) }
        /// - todo: Samplers arent supported yet

        // Consider moving this step to its own function.
        stateDescriptor.tgConfig.tgMemLength?.enumerated().forEach{
            commandEncoder.setThreadgroupMemoryLength($0, index: $1)
        }
        
        self.dispatch(using: commandEncoder, stateDescriptor: stateDescriptor)

        commandEncoder.popDebugGroup()
        commandEncoder.endEncoding()
        
        commandBuffer.commit()
    }
    
    func dispatch(using commandEncoder:MTLComputeCommandEncoder, stateDescriptor:MTKPComputePipelineStateDescriptor) {
        guard let sourceTexture = stateDescriptor.textures?.first else {
            fatalError()
        }
        
        let width = sourceTexture.width
        let height = sourceTexture.height
        let depth = 1
        
        let tgSize = stateDescriptor.tgConfig.tgSize
        
        commandEncoder.dispatchThreadgroups(
            tgSize.width,
            tgSize.height,
            tgSize.depth,
            width: width,
            height: height,
            depth: depth
        )
        
    }
}

/**
 * Convenience extensions for MTLComputeCommandEncoder
 */

extension MTLComputeCommandEncoder {
    /// Convenience method to create `x * y * z` threads per `width / x * height / y * depth / z` threadgroups.
    func dispatchThreadgroups(_ x:Int, _ y:Int, _ z:Int, width:Int, height:Int, depth:Int) {
        guard x > 0, y > 0, z > 0, width > 0, height > 0, depth > 0 else {
            fatalError("One of the parameters has been <= 0")
        }
        
        let threadGroupCount = MTLSizeMake(x, y, z)
        let threadGroups: MTLSize = MTLSizeMake(width / x, height / y, depth / z)
        
        self.dispatchThreadgroups(threadGroups, threadsPerThreadgroup: threadGroupCount)
    }
    
    /// Encodes an array of textures and sets the index according to the order in given array starting from 0. It's recommended to have the order of the textures in this array match the order used in the shader.
    func encode(_ textures:[MTLTexture]) {
        textures.enumerated().forEach{(arg: (offset: Int, element: MTLTexture)) -> () in
            let (index, texture) = arg
            self.setTexture(texture, index: index)
        }
    }
    
    /// Encodes an array of textures and sets the index according to the order in given array starting from 0. It's recommended to have the order of the textures in this array match the order used in the shader.
    func encode(_ buffers:[MTLBuffer]) {
        buffers.enumerated().forEach{(arg: (offset: Int, element: MTLBuffer)) -> () in
            let (index, buffer) = arg
            self.setBuffer(buffer, offset: 0, index: index)
        }
    }
    
    /// - todo: Encoder for samplers is missing
}
