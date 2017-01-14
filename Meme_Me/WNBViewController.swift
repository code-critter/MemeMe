//
//  ViewController.swift
//  Meme_Me
//
//  Created by W N Barker on 10/7/16.
//  Copyright © 2016 W N Barker. All rights reserved.
//

import UIKit


class WNBViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // List of outlets
    
    @IBOutlet weak var topTextField: UITextField!
    
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var topToolBar: UIToolbar!
    
    @IBOutlet weak var botToolBar: UIToolbar!

    @IBOutlet var mainView: UIView!
 
    
    // List of instances
    
    let nextView = UIImagePickerController()
    
    var botDelegate: bottomDelagate?
    var tpDelegate: topDelagate?
    
    var _height: CGFloat = 0
    
    let appDel:AppDelegate?
    
    // used to remove the status bar on top of the screen
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // List of methods
    
    required init?(coder aDecoder: NSCoder) {
        appDel = UIApplication.shared.delegate as? AppDelegate
        super.init(coder: aDecoder)
        self.botDelegate = bottomDelagate(sview: self)
        self.tpDelegate = topDelagate(sview: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        
        self.nextView.delegate = self
  
        self.subscribeToKeyboardNotifications()
        
        //self.botDelegate = bottomDelagate(sview: self)
        self.bottomTextField.delegate = botDelegate
        self.topTextField.delegate = tpDelegate
        
        
        topTextField.defaultTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeColorAttributeName : UIColor.black,
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : -3.0,
        ]
        
        topTextField.textAlignment = .center
 
        bottomTextField.defaultTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeColorAttributeName : UIColor.black,
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : -3.0,
        ]
        bottomTextField.textAlignment = .center
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ImagePicker Methods
    
    @IBAction func openImagePicker(sender: AnyObject) {
        
        nextView.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(nextView, animated: true, completion: nil)
        
        
    }

    @IBAction func openCameraImagePicker(sender: AnyObject) {
        
        nextView.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(nextView, animated: true, completion: nil)
        
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage]as? UIImage {
            
            memeImage.image = image
            
        } else {
            print("Something went wrong with the image picker")
        }
        print("Picked an image from the photo library")
        
        self.dismiss(animated: true,completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true,completion: nil)
        
    }


    @IBAction func shareMeme(_ sender: AnyObject) {
    
        //self.resignFirstResponder()
        //topTextField.resignFirstResponder()
        //bottomTextField.resignFirstResponder()

        screenShotMethod()
        
        //Create a copy of the meme

        //add the meme to the database

        //present the share window
        //how do you hand off what you want to share?
        //
    
    }
    
    @IBAction func cancelMeme(_ sender: AnyObject){
        
        topTextField.text = nil
        bottomTextField.text = nil
        memeImage.image = nil
    }

    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        print("subscribed to notifications")
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:
            NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:
            NSNotification.Name.UIKeyboardWillHide, object: nil)
        print("unsubscribed to notifications")
        
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if bottomTextField.isFirstResponder {
            
            let height = getKeyboardHeight(notification: notification)
            
            if _height == 0 {
                
                _height = height
                
                view.frame.origin.y -= height
                
            }
            
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if bottomTextField.isFirstResponder {
            
            let height = getKeyboardHeight(notification: notification)
            
            if _height > 0 {
                
                _height = 0
                
                view.frame.origin.y += height
                
            }
            
        }
        
    }
    
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        print ("\(keyboardSize.cgRectValue.size.height)")
        return keyboardSize.cgRectValue.size.height
    }
    
    //Subscribe to the keyboard notification: UIKeyboardWillHideNotification
    //Write the method “keyboardWillHide” to move the view frame back down to 0.

    
    deinit {
        self.unsubscribeFromKeyboardNotifications()
    }
    
    
    func screenShotMethod() {
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        
        topToolBar.isHidden = true
        botToolBar.isHidden = true
        
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
        let memeEntry:meme = meme(image:memeImage.image,
                                  topText:topTextField.text,
                                  botText:bottomTextField.text,
                                  meme:screenshot)
        
        appDel?.memeList.append(memeEntry)
        
        topToolBar.isHidden = false
        botToolBar.isHidden = false
        
        //let objectsToShare = screenshot as Any
        //let activityVC = UIActivityViewController(activityItems: [objectsToShare], applicationActivities: nil)
                
        //activityVC.popoverPresentationController?.sourceView = mainView
        //self.present(activityVC, animated: true, completion: nil)
        
        let image:UIImage = screenshot!
        
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
        
    }

    
}

