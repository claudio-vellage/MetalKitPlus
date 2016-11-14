//
//  MTKRenderer.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 28.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import MetalKit

/**
 * All renderers must be delegates of an MTKView.
 */
public protocol MTKRenderer : MTKViewDelegate {
    init?(device:MTLDevice, with view:MTKView)
}
