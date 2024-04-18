//
//  ControlTypeGroupModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import Foundation

enum GroupNameType: String {
    case zoomAngle = "变焦角度"
    case zoomBlur = "变焦模糊"
    case cutUp = "上"
    case cutDown = "下"
    case cutLeft = "左"
    case cutRight = "右"
    case goboFigure = "图案"
    case goboSpeed = "速度设置"
    case smokeWind = "风量"
    case smokeFog = "烟雾"
    case smokeTime = "间隔"
}

class ControlTypeGroupModel: NSObject {
    
    var nameType: GroupNameType
    
    var layoutTemplate: LayoutTemplate
    
    var sourceItems: [ControlTypeBaseProtocol]
    
    var nowItems: [ControlTypeBaseProtocol]
    
    init(nameType: GroupNameType, layoutTemplate: LayoutTemplate, items: [ControlTypeBaseProtocol]) {
        self.nameType = nameType
        self.layoutTemplate = layoutTemplate
        self.sourceItems = items
        self.nowItems = items
    }
    
    func set(value: Int, sourceIndex: Int) {
        sourceItems[sourceIndex].nowValue = value
    }
    
    func set(value: Int, nowIndex: Int) {
        nowItems[nowIndex].nowValue = value
    }
    
    func values() -> [Int] {
        return nowItems.map({$0.nowValue})
    }
}
