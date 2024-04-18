//
//  SceneTypeGoboModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/17.
//

import Foundation

class SceneTypeGoboModel: NSObject, SceneTypeBaseProtocol {
    
    var normalImage: String {
        "motion_gobo_n"
    }
    
    var selectImage: String {
        "motion_gobo_p"
    }
    
    var isSelected: Bool = false

    var titleName: String {
        "图案"
    }
    
    let valueModelArr: [ControlTypeGroupModel] = [
        ControlTypeGroupModel(nameType: .goboFigure, layoutTemplate: GogoLayoutTemplate.defaultTemplate, items: [
            ControlTypeFigureModel(nowValue: 0, countValue: 10, figureName: "图案", name: "图案")
        ]),
        ControlTypeGroupModel(nameType: .goboSpeed, layoutTemplate: VerticalLayoutTemplate.defaultTemplate, items: [
            ControlTypeSliderModel(minValue: 0, maxValue: 100, nowValue: 50, name: "速度设置"),
            ControlTypeOnOffModel(isSelected: true)
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
        if model.gobo_figure > 0 {
            nowValueModelArr.append(valueModelArr[0])
        }
        if model.gobo_speed > 0 {
            nowValueModelArr.append(valueModelArr[1])
        }
        self.nowValueModelArr = nowValueModelArr
    }
}
