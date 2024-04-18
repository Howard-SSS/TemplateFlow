//
//  ControlViewProtocol.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import UIKit

class ControlBaseView: UIView {

//    var controlModel: ControlTypeBaseProtocol { get set }
    
    var isWork: Bool = false {
        didSet {
            isHidden = !isWork
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = !isWork
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
