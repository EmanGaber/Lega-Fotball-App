//
//  BaseViewController.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit
import NVActivityIndicatorView
import SwiftyGif

class BaseViewController: UIViewController
{


    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .lightContent
        }
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
   
    func killLoading(){
        view.viewWithTag(9999)?.removeFromSuperview()
        view.viewWithTag(9998)?.removeFromSuperview()
    }

  
    func loading()
    {
        let loadingBackGroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        loadingBackGroundView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        loadingBackGroundView.tag = 9998
        self.view.addSubview(loadingBackGroundView)
        
        do {
            let gif = try UIImage(gifName: "loaderCircle.gif", levelOfIntegrity:0.5)
            
            let gifimageview = UIImageView(gifImage: gif, loopCount: -1) // Use -1 for infinite loop
            gifimageview.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 40,
                                        y: UIScreen.main.bounds.size.height / 2 - 40,
                                        width: 80,
                                        height: 80)
            gifimageview.tag = 9999
            
            try self.view.addSubview(gifimageview)
        } catch {
            print(error)
        }
        
    }
    
}
