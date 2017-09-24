//
//  ViewController.swift
//  TouchID
//
//  Created by X on 2017/9/24.
//  Copyright © 2017年 ~X~. All rights reserved.
//

import UIKit

import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
  
        let btn = UIButton.init(type: .system)
        
        btn.setTitle("TouchID", for: .normal)
        
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = UIColor.orange
        
        btn.addTarget(self, action: #selector(ViewController.btnClick(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
        
     }
 
 
    func btnClick(_ sender:UIButton)
    {
    
        print("btn click")
        
        // 1 判断touchID是否可用
        let contex = LAContext()
        
        var error: NSError?
        
        let touchIDAvailable = contex.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        
        
        if touchIDAvailable
        {
            print("可以使用该功能")
            
            // 可以使用功能，获取验证结果
            contex.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "请您验证身份", reply: { (result, error) in
                
                if result
                {
                    
                    print("身份验证成功")
                    
                
                }else
                {
                
                    print("身份验证失败，")
                    
                    let str = error?.localizedDescription
                    
                    print("\(str)")
                    
                    if str == "Fallback authentication mechanism selected."
                    {
                        // 用户点击输入密码，执行相关密码操作
                        
                        print("用户点击输入密码，执行相关密码操作")
                    
                    }
                
                }
    
            })
            
            
        }else
        {
        
            print("不能使用该功能，\(error)")
        
        }
        
        
    
    }
   

}

