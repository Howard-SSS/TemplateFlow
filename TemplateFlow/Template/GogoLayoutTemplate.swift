//
//  GogoLayoutTemplate.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import Foundation

class GogoLayoutTemplate: NSObject, LayoutTemplate {

    static let defaultTemplate: GogoLayoutTemplate = .init()
    
    func layout(controlView: ControlBaseView, index: Int, startPoint: CGPoint, endPoint: CGPoint) {
        if index == 0 {
            controlView.frame = .init(x: startPoint.x, y: startPoint.y, width: endPoint.x - startPoint.x, height: endPoint.y - startPoint.y)
        }
    }
}
