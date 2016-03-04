//
//  ViewController+AssociatedObjects.m
//  RuntimeDemo
//
//  Created by 罗成 on 15/12/24.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController+AssociatedObjects.h"
#import <objc/runtime.h>
@implementation ViewController (AssociatedObjects)

- (NSString *)associatedObject_assign {



    return objc_getAssociatedObject(self, _cmd);

}

- (void)setAssociatedObject_assign:(NSString *)associatedObject_assign {


    objc_setAssociatedObject(self, @selector(associatedObject_assign), associatedObject_assign, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)associatedObject_retain {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_retain:(NSString *)associatedObject_retain {

    objc_setAssociatedObject(self, @selector(associatedObject_retain), associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    ;

}

- (NSString *)associatedObject_copy {

    return objc_getAssociatedObject(self, _cmd);


}

- (void)setAssociatedObject_copy:(NSString *)associatedObject_copy {

    objc_setAssociatedObject(self, @selector(associatedObject_retain), associatedObject_copy, OBJC_ASSOCIATION_COPY)
    ;

}







@end
