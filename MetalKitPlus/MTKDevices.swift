//
//  MTKDevice.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 14.11.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import Metal

public struct MTKDevices {
    public static var computeDevice:MTLDevice? {
        get {
            return self.computeDevice ?? MTLCreateSystemDefaultDevice()
        }
        
        set (device) {
            self.computeDevice = device
        }
    }
    
    public static var renderDevice:MTLDevice? {
        get {
            return self.renderDevice ?? MTLCreateSystemDefaultDevice()
        }
        
        set (device) {
            self.renderDevice = device
        }
    }
}
