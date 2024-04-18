//
//  SceneTypeZoomModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/17.
//

import Foundation

class SceneTypeZoomModel: NSObject, SceneTypeBaseProtocol {
    
    var normalImage: String {
        "motion_zoom_n"
    }
    
    var selectImage: String {
        "motion_zoom_p"
    }
    
    var isSelected: Bool = false
    
    var titleName: String {
        "变焦"
    }
    
    let valueModelArr: [ControlTypeGroupModel] = [
        ControlTypeGroupModel(nameType: .zoomAngle, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 1, maxValue: 90, nowValue: 45, name: "变焦")
        ]),
        ControlTypeGroupModel(nameType: .zoomBlur, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 1, maxValue: 10, nowValue: 5, name: "模糊")
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
        for groupModel in valueModelArr {
            if model.zoom_angle > 0 && groupModel.nameType == .zoomAngle {
                nowValueModelArr.append(groupModel)
            }
            if model.zoom_blur > 0 && groupModel.nameType == .zoomBlur {
                nowValueModelArr.append(groupModel)
            }
        }
        self.nowValueModelArr = nowValueModelArr
    }
}
