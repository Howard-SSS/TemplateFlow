//
//  ControlOnOffView.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import UIKit

class ControlOnOffView: ControlBaseView {

    var controlModel: ControlTypeOnOffModel {
        didSet {
            btn.isSelected = controlModel.nowValue > 0 ? true : false
        }
    }
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: bounds)
        btn.setImage(.init(named: "switch_onoff_off"), for: .normal)
        btn.setImage(.init(named: "switch_onoff_on"), for: .selected)
        btn.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
        return btn
    }()
    
    override var frame: CGRect {
        didSet {
            btn.frame = bounds
        }
    }
    
    init(frame: CGRect, controlModel model: ControlTypeOnOffModel) {
        controlModel = model
        super.init(frame: frame)
        backgroundColor = .init(hexValue: 0xC3C3C3)
        addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func touchBtn() {
        btn.isSelected.toggle()
        controlModel.nowValue = btn.isSelected ? 1 : 0
    }
}
