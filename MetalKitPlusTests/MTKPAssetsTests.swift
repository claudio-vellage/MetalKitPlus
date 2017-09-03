//
//  MTKPAssetsTest.swift
//  MetalKitPlusTests
//
//  Created by Claudio Vellage on 03.09.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import XCTest

class MTKPAssetsTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let assets = MTKPAssets()

        XCTAssert(assets.device != nil)
        XCTAssert(assets.library != nil)
        XCTAssert(assets.dictionary != nil)
    }
    
    func testInitWithClass() {
        let assets = MTKPAssets(MTKPShaderLookup.self)
        
        XCTAssert(assets.device != nil)
        XCTAssert(assets.library != nil)
        XCTAssert(assets.dictionary != nil)
    }
    
}
