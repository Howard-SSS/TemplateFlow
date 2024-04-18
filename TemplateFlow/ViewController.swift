//
//  ViewController.swift
//  TemplateFlow
//
//  Created by Howard-Zjun on 2024/04/17.
//

import UIKit

class ViewController: UIViewController {

    let motionInfo: MotionInfo = .init()
    
    let factory: ControlFactory = .init()
    
    var allSceneTypeArr: [SceneTypeBaseProtocol] = []
    
    var nowSceneTypeArr: [SceneTypeBaseProtocol] = []
    
    var sceneTypeViewArr: [(UIButton, UILabel)] = []
    
    var nowSceneType: SceneTypeBaseProtocol!
    
    var segment: UISegmentedControl?
    
    var sceneTypeBtnOffser: Int {
        100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configData()
        var minX = (view.width - 65 * CGFloat(nowSceneTypeArr.count)) * 0.5
        var sceneTypeViewArr: [(UIButton, UILabel)] = []
        for (index, sceneType) in nowSceneTypeArr.enumerated() {
            let btn = UIButton(frame: .init(x: minX, y: 100, width: 65, height: 30))
            btn.tag = sceneTypeBtnOffser + index
            btn.setImage(.init(named: sceneType.normalImage), for: .normal)
            btn.setImage(.init(named: sceneType.selectImage), for: .selected)
            btn.isSelected = sceneType.isSelected
            btn.addTarget(self, action: #selector(touchSceneType(_:)), for: .touchUpInside)
            
            let lab = UILabel(frame: .init(x: minX, y: btn.maxY + 1, width: btn.width, height: 11))
            lab.font = .systemFont(ofSize: 10)
            lab.textColor = .init(hexValue: (sceneType.isSelected ? 0x46AA5F : 0x787878))
            lab.text = sceneType.titleName
            lab.textAlignment = .center
            lab.adjustsFontSizeToFitWidth = true
            
            view.addSubview(btn)
            view.addSubview(lab)
            sceneTypeViewArr.append((btn, lab))
            minX = btn.maxX
        }
        self.sceneTypeViewArr = sceneTypeViewArr
        resetSegment()
        resetContentView()
    }

    func configData() {
        allSceneTypeArr = [
            SceneTypeZoomModel(model: motionInfo),
            SceneTypeCutModel(model: motionInfo),
            SceneTypeBarndoorModel(model: motionInfo),
            SceneTypeGoboModel(model: motionInfo),
            SceneTypeSmokeModel(model: motionInfo)
        ]
        var tempSceneTypeArr: [SceneTypeBaseProtocol] = []
        for sceneTypeModel in allSceneTypeArr {
            if sceneTypeModel.nowValueModelArr.count > 0 {
                tempSceneTypeArr.append(sceneTypeModel)
            }
        }
        nowSceneTypeArr = tempSceneTypeArr
        nowSceneType = nowSceneTypeArr[0]
        nowSceneType.isSelected = true
    }
    
    func resetSegment() {
        segment?.removeFromSuperview()
        let segment = UISegmentedControl(items: nowSceneType.nowValueModelArr.map({$0.nameType.rawValue}))
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = .init(hexValue: 0xC3C3C3)
        segment.tintColor = .white
        let segmentWidth: CGFloat = CGFloat(nowSceneType.nowValueModelArr.count) * 65
        segment.frame = .init(x: sceneTypeViewArr[0].1.minX + (65 * CGFloat(nowSceneTypeArr.count) - segmentWidth) * 0.5, y: sceneTypeViewArr[0].1.maxY + 20, width: segmentWidth, height: 30)
        segment.addTarget(self, action: #selector(touchSegment), for: .valueChanged)
        view.addSubview(segment)
        self.segment = segment
    }
    
    @objc func touchSceneType(_ sender: UIButton) {
        for (index, (btn, lab)) in sceneTypeViewArr.enumerated() {
            btn.isSelected = false
            lab.textColor = .init(hexValue: 0x787878)
            if btn == sender {
                btn.isSelected = true
                lab.textColor = .init(hexValue: 0x46AAa5F)
                nowSceneType = nowSceneTypeArr[index]
            }
        }
        resetSegment()
        resetContentView()
    }
    
    @objc func touchSegment() {
        resetContentView()
    }

    func resetContentView() {
        guard let segment = segment else {
            return
        }
        let groupModel = nowSceneType.nowValueModelArr[segment.selectedSegmentIndex]
        factory.releaseControlView()
        let startPoint = CGPoint(x: 0, y: segment.maxY + 30)
        let endPoint = CGPoint(x: view.width, y: view.height - 30)
        for (index, nowItem) in groupModel.nowItems.enumerated() {
            if let controlBaseView = factory.getControlView(controlModel: nowItem, onView: view) {
                groupModel.layoutTemplate.layout(controlView: controlBaseView, index: index, startPoint: startPoint, endPoint: endPoint)
            }
        }
    }
}

