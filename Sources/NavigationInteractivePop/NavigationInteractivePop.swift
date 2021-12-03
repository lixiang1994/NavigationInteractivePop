//
//  NavigationInteractivePop.swift
//  ┌─┐      ┌───────┐ ┌───────┐
//  │ │      │ ┌─────┘ │ ┌─────┘
//  │ │      │ └─────┐ │ └─────┐
//  │ │      │ ┌─────┘ │ ┌─────┘
//  │ └─────┐│ └─────┐ │ └─────┐
//  └───────┘└───────┘ └───────┘
//
//  Created by lee on 2021/12/3.
//  Copyright © 2021年 lee. All rights reserved.
//

import UIKit

@available(iOS 7.0, *)
extension UIViewController {
    
    @objc
    /// 导航侧滑返回手势状态
    open var navigationInteractivePopEnabled: Bool {
        return true
    }
    
    /// 更新导航侧滑返回手势状态
    public func setNeedsNavigationInteractivePopEnabledUpdate() {
        guard let navigation = navigationController else { return }
        guard let top = navigation.topViewController else { return }
        guard top == self || top.children.contains(self) else { return }
        navigation.interactivePopGestureRecognizer?.isEnabled = navigationInteractivePopEnabled
    }
}

@available(iOS 7.0, *)
extension UINavigationController {
    
    @objc
    open override var navigationInteractivePopEnabled: Bool {
        return topViewController?.navigationInteractivePopEnabled ?? true
    }
}

@available(iOS 7.0, *)
extension UITabBarController {
    
    @objc
    open override var navigationInteractivePopEnabled: Bool {
        return selectedViewController?.navigationInteractivePopEnabled ?? true
    }
}

extension UINavigationController: UINavigationBarDelegate {
    
    @objc
    @available(iOS 2.0, *)
    open func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        return true
    }
    
    @objc
    @available(iOS 2.0, *)
    open func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        return true
    }
    
    @objc
    @available(iOS 2.0, *)
    open func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        interactivePopGestureRecognizer?.isEnabled = topViewController?.navigationInteractivePopEnabled ?? false
    }
    
    @objc
    @available(iOS 2.0, *)
    open func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        interactivePopGestureRecognizer?.isEnabled = topViewController?.navigationInteractivePopEnabled ?? false
    }
}
