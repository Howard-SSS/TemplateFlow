//
//  ControlTypeSliderModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import Foundation

class ControlTypeSliderModel: ControlTypeBaseProtocol {
    
    var nowValue: Int = 0

    var identify: String {
        NSStringFromClass(Self.self)
    }
    
    var isSupport: Bool = false
    
    var minValue: Int = 0
    
    var maxValue: Int = 100
    
    var name: String = ""
    
    init(minValue: Int, maxValue: Int, nowValue: Int, name: String) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.nowValue = nowValue
        self.name = name
    }
}
