//
//  ViewController+AssociatedObjects.h
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/24.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (AssociatedObjects)
@property (nonatomic, strong) NSString *associatedObject_retain;
@property (nonatomic, assign) NSString *associatedObject_assign;
@property (nonatomic, copy) NSString *associatedObject_copy;
@end
