//
//  CustomView.swift
//  ExpandableCustomView
//
//  Created by Edvinas Sarkus on 10/07/2020.
//  Copyright © 2020 Edvinas Sarkus. All rights reserved.
//

import UIKit
@IBDesignable
class CustomView: UIView {
    var contentView:UIView?
    @IBInspectable var nibName:String?
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
    }
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
           xibSetup()
       }

    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
         view.autoresizingMask =
                    [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
                    withOwner: self,
                    options: nil).first as? UIView
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
