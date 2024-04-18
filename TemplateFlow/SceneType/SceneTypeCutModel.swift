//
//  SceneTypeCutModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/17.
//

import Foundation

class SceneTypeCutModel: NSObject, SceneTypeBaseProtocol {
    
    var normalImage: String {
        "motion_cut_n"
    }
    
    var selectImage: String {
        "motion_cut_p"
    }
    
    var isSelected: Bool = false

    var titleName: String {
        "切割"
    }
    
    let valueModelArr: [ControlTypeGroupModel] = [
        ControlTypeGroupModel(nameType: .cutUp, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "上"),
            ControlTypeSliderModel(minValue: 0, maxValue: 100, nowValue: 50, name: "角度")
        ]),
        ControlTypeGroupModel(nameType: .cutDown, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "下"),
            ControlTypeSliderModel(minValue: 0, maxValue: 100, nowValue: 50, name: "角度")
        ]),
        ControlTypeGroupModel(nameType: .cutLeft, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "左"),
            ControlTypeSliderModel(minValue: 0, maxValue: 100, nowValue: 50, name: "角度")
        ]),
        ControlTypeGroupModel(nameType: .cutRight, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 10, nowValue: 5, name: "右"),
            ControlTypeSliderModel(minValue: 0, maxValue: 100, nowValue: 50, name: "角度")
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
            if model.cut_dire == 0 && model.cut_angle == 0 {
                continue
            }
            var nowItems: [ControlTypeBaseProtocol] = []
            if model.cut_dire > 0 {
                nowItems.append(groupModel.sourceItems[0])
            }
            if model.cut_angle > 0 {
                nowItems.append(groupModel.sourceItems[1])
            }
            groupModel.nowItems = nowItems
            nowValueModelArr.append(groupModel)
        }
        self.nowValueModelArr = nowValueModelArr
    }
}
