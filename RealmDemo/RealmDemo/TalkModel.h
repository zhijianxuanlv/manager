//
//  TalkModel.h
//  RealmDemo
//
//  Created by 罗成 on 16/1/5.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <Realm/Realm.h>

@interface TalkModel : RLMObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *comment;

@end
RLM_ARRAY_TYPE(TalkModel)