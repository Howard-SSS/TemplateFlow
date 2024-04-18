//
//  SceneTypeSmokeModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import Foundation

class SceneTypeSmokeModel: NSObject, SceneTypeBaseProtocol {

    var normalImage: String {
        "motion_smoke_n"
    }
    
    var selectImage: String {
        "motion_smoke_p"
    }
    
    var isSelected: Bool = false

    var titleName: String {
        "烟雾"
    }
    
    let valueModelArr: [ControlTypeGroupModel] = {
        let onOffModel = ControlTypeOnOffModel(isSelected: true)
        var ret: [ControlTypeGroupModel] = [
            ControlTypeGroupModel(nameType: .smokeWind, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
                ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "风量"),
                onOffModel
            ]),
            ControlTypeGroupModel(nameType: .smokeFog, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
                ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "烟雾"),
                onOffModel
            ]),
            ControlTypeGroupModel(nameType: .smokeTime, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
                ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "间隔"),
                onOffModel
            ])
        ]
        return ret
    }()
    
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
        for groupModel in valueModelArr {
            if model.smoke > 0 {
                nowValueModelArr.append(groupModel)
            }
        }
        self.nowValueModelArr = nowValueModelArr
    }
}
