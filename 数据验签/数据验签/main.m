//
//  main.m
//  数据验签
//
//  Created by 罗成 on 16/2/25.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Encryption.h"
static NSString *BEL_SECRET = @"B9rW6eMAwRxa8";
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSTimeInterval timeStamp = [NSDate new].timeIntervalSince1970;
        NSString *timeString = [NSString stringWithFormat:@"%.0f",timeStamp];
        NSString *nonce = [NSString genUUID];
        
        NSString *sign = [NSString stringWithFormat:@"%@%@%@", BEL_SECRET,nonce, timeString];
        NSString *signStr = [sign sha1String];
        NSLog(@"signStr = > %@",signStr);
        NSLog(@"nonce = > %@",nonce);
        NSLog(@"sign = > %@",sign);
    }
    return 0;
}
