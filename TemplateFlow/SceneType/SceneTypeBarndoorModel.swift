//
//  SceneTypeBarndoorModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/17.
//

import Foundation

class SceneTypeBarndoorModel: NSObject, SceneTypeBaseProtocol {
    
    var normalImage: String {
        "motion_barndoor_n"
    }
    
    var selectImage: String {
        "motion_barndoor_p"
    }
    
    var isSelected: Bool = false

    var titleName: String {
        "遮光板"
    }
    
    let valueModelArr: [ControlTypeGroupModel] = [
        ControlTypeGroupModel(nameType: .cutUp, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "上")
        ]),
        ControlTypeGroupModel(nameType: .cutDown, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "下")
        ]),
        ControlTypeGroupModel(nameType: .cutLeft, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "左")
        ]),
        ControlTypeGroupModel(nameType: .cutRight, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "右")
        ])
    ]
    
    var nowValueModelArr: [ControlTypeGroupModel] = []
    
    override init() {
        super.init()
        nowValueModelArr = valueModelArr
    }
    
    required init(model: MotionInfo) {
        super.init()
        updateModel(model: model)
    }
    
    func updateModel(model: MotionInfo) {
        var nowValueModelArr: [ControlTypeGroupModel] = []
        for controlModel in valueModelArr {
            if model.barndoor > 0 {
                nowValueModelArr.append(controlModel)
            }
        }
        self.nowValueModelArr = nowValueModelArr
    }
}
