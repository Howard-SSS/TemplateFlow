//
//  ControlTypeFigureModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import Foundation

class ControlTypeFigureModel: ControlTypeBaseProtocol {
    
    var nowValue: Int = 0
    
    var identify: String {
        NSStringFromClass(Self.self)
    }
    
    var countValue: Int
    
    var figureName: String
    
    var name: String
    
    init(nowValue: Int, countValue: Int, figureName: String, name: String) {
        self.nowValue = nowValue
        self.countValue = countValue
        self.figureName = figureName
        self.name = name
    }
}
