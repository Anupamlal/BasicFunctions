//
//  UIExtensions.swift
//
//
//  Created by Anupam Kumar on 07/07/24.
//

import Foundation
import UIKit

public extension UIView {
    
    func setCornerRadius(cornerRadius: CGFloat) {
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }

}

public extension UIImage {
    
    func alwaysUseTemplateMode() {
        self.withRenderingMode(.alwaysTemplate)
    }
    
}


public extension UIButton {
    
    class func createPrimaryButton(with text: String?, textColor: UIColor, font: UIFont, cornerRadius: CGFloat = 0.0, backgroundColor: UIColor = .clear) -> UIButton {
        
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = font
        button.setCornerRadius(cornerRadius: cornerRadius)
        button.backgroundColor = backgroundColor
        
        return button
    }
    
    class func createPrimaryButton(with image: UIImage?, textColor: UIColor, font: UIFont, cornerRadius: CGFloat = 0.0, backgroundColor: UIColor = .clear) -> UIButton {
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.setCornerRadius(cornerRadius: cornerRadius)
        button.backgroundColor = backgroundColor
        
        return button
    }
    
}

public extension UITableView {
    
    func registerWithNib<T: UITableViewCell>(with cell: T.Type) {
        register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellReuseIdentifier: String(describing: cell.self))
    }
    
    func dequeueCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue \(String(describing: cellClass)) with reuseId of \(String(describing: T.self))")
        }
        return cell
    }
}

public extension UIEdgeInsets {

    init(top: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bottom, right: right)
    }
    
    var vertical: CGFloat {
        return top + bottom
    }

    var horizontal: CGFloat {
        return left + right
    }
}
