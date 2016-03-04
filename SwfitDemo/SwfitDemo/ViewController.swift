//
//  ViewController.swift
//  SwfitDemo
//
//  Created by 罗成 on 15/11/23.
//  Copyright © 2015年 罗成. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController,UIAlertViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let numberOflegs = ["luocheng":[2,3,4],"zhangsan":[5,8,9]];
        for (name,list) in numberOflegs {
        
            print(name,list);
        
        }
        
        let str = "ABC" //str 是字符串变量 即使字符集合
        for temp in str.characters {
        
            print(temp);
        
        }
        
        
        
        
        sayHello("luocheng",age:"23");
    
        halfOpenRangleLength(1, end: 10);
        
        let label = UILabel(frame: CGRectMake(10, 50, 150, 50));
        
        label.text = "this is label";
        
        self.view .addSubview(label);
        
        let btn = UIButton();
        btn.frame = CGRectMake(10, 200, 100, 100);
        
        btn.setTitle("按钮", forState: UIControlState.Normal);
        btn.addTarget(self, action:"btnClick:",forControlEvents: UIControlEvents.TouchUpInside);
        btn.backgroundColor = UIColor.redColor();
        self.view .addSubview(btn);

    }
    
    func btnClick(sender:UIButton!){
    
        let alerView = UIAlertView()
        alerView.title = "dianji";
        alerView.message = "dianji";
        alerView.delegate = self;
        alerView.addButtonWithTitle("cancel");
        alerView.addButtonWithTitle("ok");
        alerView.show();
    
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func sayHello(personName:String,age:String) {
    
        print(personName);
    
    }
    
    func halfOpenRangleLength (start:Int,end:Int)->Int {
    
        print(start + end);
        return start + end;
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        sayHello("luocheng",age:"23");
        
        var sum = 3;
        var plan = 4;
        swapTwoInts(&sum, b: &plan);
        print("sum",sum,"plan",plan);
        
    }
     func swapTwoInts(inout a: Int, inout b: Int) {
        let temporaryA = a
        a=b
        b = temporaryA
        
        print(a,b);
    }
    
     func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            print("点击了1")
    }else {
        print("点击2222")
        
        }
        
        
    }

}



