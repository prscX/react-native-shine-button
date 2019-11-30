//
//  WCLShineButton.swift
//  WCLShineButton
//
// **************************************************
// *                                  _____         *
// *         __  _  __     ___        \   /         *
// *         \ \/ \/ /    / __\       /  /          *
// *          \  _  /    | (__       /  /           *
// *           \/ \/      \___/     /  /__          *
// *                               /_____/          *
// *                                                *
// **************************************************
//  Github  :https://github.com/imwcl
//  HomePage:http://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class WCLShineButton
// @abstract WCLShineButton
// @discussion WCLShineButton
//

import UIKit

@IBDesignable
public class WCLShineButton: UIControl {
    
    /// 更多的配置参数
    public var params: WCLShineParams {
        didSet {
            clickLayer.animDuration = params.animDuration/3
            shineLayer.params       = params
        }
    }
    
    /// 未点击的颜色
    @IBInspectable public var color: UIColor = UIColor.lightGray {
        willSet {
            clickLayer.color = newValue
        }
    }
    
    /// 点击后的颜色
    @IBInspectable public var fillColor: UIColor = UIColor(rgb: (255, 102, 102)) {
        willSet {
            clickLayer.fillColor = newValue
            shineLayer.fillColor = newValue
        }
    }
    
    /// button的图片
    @IBInspectable public var image: NSString = ".heart" {
        willSet {
            switch newValue {
            case ".heart":
                clickLayer.image = .heart
            case ".like":
                clickLayer.image = .like
            case ".smile":
                clickLayer.image = .smile
            case ".star":
                clickLayer.image = .star
            default:
                clickLayer.image = .heart
            }
//            clickLayer.image = newValue
        }
    }
    
    @objc public var customImage: UIImage = UIImage() {
        willSet {
            let image = WCLShineImage.custom(newValue)
            clickLayer.image = image
        }
    }
    
    /// 是否点击的状态
    public override var isSelected: Bool {
        didSet {
            clickLayer.clicked = isSelected
        }
    }

    @IBInspectable public var getSelection: Bool {
        print("Clicked: \(clickLayer.clicked)")
        return clickLayer.clicked
    }
    
    private var clickLayer = WCLShineClickLayer()
    
    private var shineLayer = WCLShineLayer()
    
    //MARK: Initial Methods
    public init(frame: CGRect, params: WCLShineParams) {
        self.params = params
        super.init(frame: frame)
        initLayers()
    }
    
    public override init(frame: CGRect) {
        params = WCLShineParams()
        super.init(frame: frame)
        initLayers()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        params = WCLShineParams()
        super.init(coder: aDecoder)
        layoutIfNeeded()
        initLayers()
    }
    
    @objc
    public func setClicked(_ clicked: Bool, animated: Bool = true) {
        guard clicked != clickLayer.clicked else {
            return
        }
        if clicked {
            shineLayer.endAnim = { [weak self] in
                self?.clickLayer.clicked = clicked
                if animated {
                    self?.clickLayer.startAnim()
                }
                self?.isSelected = clicked
            }
            if animated {
                shineLayer.startAnim()
            } else {
                shineLayer.endAnim?()
            }
        } else {
            clickLayer.clicked = clicked
            isSelected = clicked
        }
    }
    
    //MARK: Override
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if clickLayer.clicked == false {
            shineLayer.endAnim = { [weak self] in
//                self?.clickLayer.clicked = !(self?.clickLayer.clicked ?? false)
                self?.clickLayer.startAnim()
//                self?.isSelected = self?.clickLayer.clicked ?? false
                self?.sendActions(for: .valueChanged)
            }
            clickLayer.clicked = true
            shineLayer.startAnim()
        }else {
            clickLayer.clicked = !clickLayer.clicked
            isSelected = clickLayer.clicked
            sendActions(for: .valueChanged)
        }
    }
    
    //MARK: Privater Methods
    @objc
    public func initLayers() {
        clickLayer.animDuration = params.animDuration/3
        shineLayer.params       = params
        clickLayer.frame = bounds
        shineLayer.frame = bounds
        layer.addSublayer(clickLayer)
        layer.addSublayer(shineLayer)
    }
}
