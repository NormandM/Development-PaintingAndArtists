//
//  MessageView.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-07-15.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit

class MessageView {
    class func showMessageView(view: UIView, messageView: UIView, button: UIButton?, visualEffect: UIVisualEffectView, effect:UIVisualEffect, diplomaImageView: UIImageView?, totalPaintings: Int?) {
        let successiveRightAnswers = UserDefaults.standard.integer(forKey: "successiveRightAnswers")
        messageView.layer.cornerRadius = 5
        view.addSubview(messageView)
        messageView.layer.borderWidth = 5
        messageView.layer.borderColor = UIColor(red: 27/255, green: 95/255, blue: 94/255, alpha: 1.0).cgColor
        if let buttonOk = button{
            buttonOk.layer.cornerRadius = buttonOk.frame.height / 2.0
            buttonOk.titleLabel?.textAlignment = NSTextAlignment.center
            buttonOk.backgroundColor = UIColor(red: 27/255, green: 95/255, blue: 94/255, alpha: 1.0)
            buttonOk.titleLabel?.numberOfLines = 0
            buttonOk.titleLabel?.textAlignment = NSTextAlignment.center
        }

        let messageViewWidth = view.frame.width * 0.7
        var messageViewHeight = view.frame.height * 0.6
        var messageXPosition = view.frame.size.width  / 2 - messageViewWidth/2
        var messageYPosition = view.frame.size.height/2 - messageViewHeight/2
        var imageName = String()
        switch successiveRightAnswers {
        case 5:
            imageName = "artist"
        case 15:
            imageName = "exhibition2"
        case 30:
            imageName = "artExpert3"
        case 50:
            imageName = "mortarboard"
        case totalPaintings:
            imageName = "artist"
        default:
            messageViewHeight = view.frame.height * 0.3
            messageXPosition = view.frame.size.width  / 2 - messageViewWidth/2
            messageYPosition = view.frame.size.height/2 - messageViewHeight/2
        }
        messageView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        messageView.alpha = 0
        UIView.animate(withDuration: 0.8) {
            visualEffect.effect = effect
            messageView.alpha = 1.0
            messageView.transform = CGAffineTransform.identity
        }

        messageView.frame = CGRect(x: messageXPosition, y: messageYPosition , width: messageViewWidth, height: messageViewHeight)
        if let diplomaView = diplomaImageView {
            ImageManager.choosImage(imageView: diplomaView, imageName: imageName)
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
