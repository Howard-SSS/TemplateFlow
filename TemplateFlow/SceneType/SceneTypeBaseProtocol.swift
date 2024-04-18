//
//  SceneTypeBaseModel.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/17.
//

import Foundation

protocol SceneTypeBaseProtocol {

    var normalImage: String { get }
    
    var selectImage: String { get }
    
    var isSelected: Bool { get set }
    
    var titleName: String { get }
    
    var valueModelArr: [ControlTypeGroupModel] { get }
    
    var nowValueModelArr: [ControlTypeGroupModel] { get set }
    
    init(model: MotionInfo)
    
    func updateModel(model: MotionInfo)
}
