//
//  MTKPComputerTest.swift
//  MetalKitPlusTests
//
//  Created by Claudio Vellage on 28.12.17.
//  Copyright © 2017 Claudio Vellage. All rights reserved.
//

import XCTest
@testable import MetalKitPlus

struct MTKPTestComputer : MTKPComputer {
    let assets:MTKPAssets
    
    init(assets:MTKPAssets) {
        self.assets = assets
    }
}

class MTKPComputerTest: XCTestCase {

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
        let testComputer = MTKPTestComputer(assets: assets)
        
        XCTAssert(testComputer.assets != nil)
    }
}
