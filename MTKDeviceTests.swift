//
//  MTKDeviceTests.swift
//  MetalKitPlus
//
//  Created by Claudio Vellage on 03.03.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import XCTest

class MTKDeviceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let mtkDevice = MTKDevice.instance
        let device = mtkDevice.device
        
        XCTAssert(device != nil)
    }
    
    func testSingletonMTKDevice() {
        let instance1 = MTKDevice.instance
        let instance2 = MTKDevice.instance
        
        XCTAssert(instance1 === instance2)
    }
    
    func testSingletonMTLDevice() {
        let instance1 = MTKDevice.instance
        let instance2 = MTKDevice.instance
        
        XCTAssert(instance1.device === instance2.device)
    }

}
