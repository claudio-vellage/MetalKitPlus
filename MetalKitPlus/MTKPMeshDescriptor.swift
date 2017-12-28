//
//  MTKPMeshDescriptor.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 13.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
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

import Foundation
import Metal
import MetalKit
import ModelIO

// Warning: This code is not maintained!

public protocol MTKPMeshDescriptor {
    var vertexBuffer: MTLBuffer! { get set }
    var vertexDescriptor: MTLVertexDescriptor! { get set }
    var primitiveType: MTLPrimitiveType! { get set }
    var indexBuffer: MTLBuffer! { get set }
    var indexCount: Int! { get set }
    var indexType: MTLIndexType! { get set }
}

public struct MTKPCubeDescriptor : MTKPMeshDescriptor, MTKPDeviceUser {
    public var vertexBuffer: MTLBuffer! = nil
    public var vertexDescriptor: MTLVertexDescriptor! = nil
    public var primitiveType: MTLPrimitiveType! = nil
    public var indexBuffer: MTLBuffer! = nil
    public var indexCount: Int! = nil
    public var indexType: MTLIndexType! = nil
    
    public init?(cubeWithSize size: Float) {
        guard let device = self.device else {
            fatalError("The device has not been initialized")
        }
        
        let allocator = MTKMeshBufferAllocator(device: device)
    
        let mdlMesh = MDLMesh(boxWithExtent: vector_float3(size, size, size),
        segments: vector_uint3(10, 10, 10),
        inwardNormals: false,
        geometryType: .triangles,
        allocator: allocator)
    
        do {
            let mtkMesh = try MTKMesh(mesh: mdlMesh, device: device)
            let mtkVertexBuffer = mtkMesh.vertexBuffers[0]
            let submesh = mtkMesh.submeshes[0]
            let mtkIndexBuffer = submesh.indexBuffer
    
            vertexBuffer = mtkVertexBuffer.buffer
            vertexBuffer.label = "Mesh Vertices"
    
            vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mdlMesh.vertexDescriptor)!
            primitiveType = submesh.primitiveType
            indexBuffer = mtkIndexBuffer.buffer
            indexBuffer.label = "Mesh Indices"
    
            indexCount = submesh.indexCount
            indexType = submesh.indexType
        } catch _ {
            return nil // Unable to create MTK mesh from MDL mesh
        }
    }
}
