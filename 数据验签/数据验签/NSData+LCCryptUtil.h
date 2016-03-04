//
//  NSData+LCCryptUtil.h
//  MoblieAuth
//
//  Created by Leon on 11/27/14.
//  Copyright (c) 2014 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LCCryptUtil)

- (NSData*)AES256EncryptWithKey:(NSString*)key;
- (NSData*)AES256DecryptWithKey:(NSString*)key;

@end
