//
//  ControlTypeOnOffModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import Foundation

class ControlTypeOnOffModel: ControlTypeBaseProtocol {
    
    var nowValue: Int = 0
    
    var identify: String {
        NSStringFromClass(Self.self)
    }
    
    init(isSelected: Bool) {
        nowValue = isSelected ? 1 : 0
    }
}
