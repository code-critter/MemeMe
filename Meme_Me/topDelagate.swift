//
//  topDelegate.swift
//  Meme_Me
//
//  Created by W N Barker on 10/12/16.
//  Copyright © 2016 W N Barker. All rights reserved.
//


import UIKit

class topDelagate: NSObject, UITextFieldDelegate {
    
    var view: WNBViewController
    
    init(sview: WNBViewController){
        view = sview
        super.init()
        //self.subscribeToKeyboardNotifications()
    }
    


func textFieldShouldClear(_ textField: UITextField) -> Bool {
    return true
}


func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return true
}


func textFieldDidBeginEditing(_ textField: UITextField) {
    
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
}


func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    return true
}


func textFieldDidEndEditing(_ textField: UITextField) {
    
    textField.resignFirstResponder()
    
}


func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    
}


func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    return true
}


}
