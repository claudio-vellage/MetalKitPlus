//
//  MTKMeshDescriptorTests.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 04.03.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import XCTest

class MTKPCubeDescriptorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCube() {
        let mesh = MTKPCubeDescriptor(cubeWithSize: 1.0)
        
        XCTAssert(mesh != nil)
    }

}
