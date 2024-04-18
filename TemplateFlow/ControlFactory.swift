//
//  ControlFactory.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/18.
//

import UIKit

class ControlFactory: NSObject {

    private var dict: [String : [ControlBaseView]] = [:]
    
    private let lock = NSLock()
    
    func releaseControlView() {
        lock.lock()
        for controlViewArr in dict.values {
            for controlView in controlViewArr {
                controlView.isWork = false
            }
        }
        lock.unlock()
    }
    
    func getControlView(controlModel: ControlTypeBaseProtocol, onView: UIView, size: CGSize? = nil) -> ControlBaseView? {
        var ret: ControlBaseView!
        var controlViewArr = getControlViewArr(controlModel: controlModel)
        for controlBaseView in controlViewArr {
            if !controlBaseView.isWork {
                ret = controlBaseView
            }
        }
        if ret == nil {
            if let sliderModel = controlModel as? ControlTypeSliderModel {
                let size = size ?? .init(width: 300, height: 75)
                ret = ControlSliderView(frame: .init(origin: .zero, size: size), controlModel: sliderModel)
            } else if let onOffModel = controlModel as? ControlTypeOnOffModel {
                let size = size ?? .init(width: 40, height: 40)
                ret = ControlOnOffView(frame: .init(origin: .zero, size: size), controlModel: onOffModel)
            } else if let figureModel = controlModel as? ControlTypeFigureModel {
                let size = size ?? .init(width: 520, height: 782)
                ret = ControlFigureView(frame: .init(origin: .zero, size: size), controlModel: figureModel)
            } else {
                
            }
            DispatchQueue.main.async {
                onView.addSubview(ret)
            }
        }
        if let ret = ret {
            controlViewArr.append(ret)
            setControlViewArr(controlModel: controlModel, controlViewArr: controlViewArr)
        }
        ret.isWork = true
        if let controlSingleThumSliderView = ret as? ControlSliderView, let sliderModel = controlModel as? ControlTypeSliderModel {
            controlSingleThumSliderView.controlModel = sliderModel
        } else if let controlOnOffView = ret as? ControlOnOffView, let onOffModel = controlModel as? ControlTypeOnOffModel {
            controlOnOffView.controlModel = onOffModel
        } else if let controlFigureView = ret as? ControlFigureView, let figureModel = controlModel as? ControlTypeFigureModel {
            controlFigureView.controlModel = figureModel
        } else {
            
        }
        return ret
    }
    
    private func getControlViewArr(controlModel: ControlTypeBaseProtocol) -> [ControlBaseView] {
        lock.lock()
        let ret = dict[controlModel.identify]
        lock.unlock()
        return ret ?? []
    }
    
    private func setControlViewArr(controlModel: ControlTypeBaseProtocol, controlViewArr: [ControlBaseView]) {
        lock.lock()
        dict[controlModel.identify] = controlViewArr
        lock.unlock()
    }
}
