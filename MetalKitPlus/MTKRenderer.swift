//
//  MTKRenderer.swift
//  MTKViewComputation
//
//  Created by Claudio Vellage on 28.08.16.
//  Copyright © 2016 Claudio Vellage. All rights reserved.
//

import MetalKit

/*
 * All renderers should be able to draw to an MTKView.
 */

public protocol MTKRenderer : MTKViewDelegate {
    init?(with view:MTKView)
}
