//
//  MessageView.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-15.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class MessageView {
    class func showMessageView(view: UIView, messageView: UIView, button: UIButton, visualEffect: UIVisualEffectView, effect:UIVisualEffect) {
        messageView.layer.cornerRadius = 5
        view.addSubview(messageView)
        messageView.layer.borderWidth = 5
        messageView.layer.borderColor = UIColor(red: 27/255, green: 95/255, blue: 94/255, alpha: 1.0).cgColor
        button.layer.cornerRadius = button.frame.height / 2.0
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.backgroundColor = UIColor(red: 27/255, green: 95/255, blue: 94/255, alpha: 1.0)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = NSTextAlignment.center
        let messageViewHeight = view.frame.height * 0.3
        let messageViewWidth = view.frame.width * 0.7
        let messageXPosition = view.frame.size.width  / 2 - messageViewWidth/2
        let messageYPosition = view.frame.size.height/2 - messageViewHeight/2
        messageView.frame = CGRect(x: messageXPosition, y: messageYPosition , width: messageViewWidth, height: messageViewHeight)
        messageView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        messageView.alpha = 0
        UIView.animate(withDuration: 0.8) {
            visualEffect.effect = effect
            messageView.alpha = 1
            messageView.transform = CGAffineTransform.identity
        }
    }
    class func dismissMessageview(messageView: UIView, visualEffect: UIVisualEffectView, effect:UIVisualEffect) {
        UIView.animate(withDuration: 0.8, animations: {
            messageView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            messageView.alpha = 0
            visualEffect.effect = nil
        }) { (success: Bool) in
            messageView.removeFromSuperview()
        }
    }

}
