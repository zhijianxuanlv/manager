//
//  LCRequestManager.m
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/22.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "LCRequestManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AFNetworkActivityIndicatorManager.h"
@interface LCRequestManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManger;

@end

@implementation LCRequestManager

- (AFHTTPSessionManager *)sessionManger {
    if (_sessionManger == nil) {
        _sessionManger = [AFHTTPSessionManager manager];
        //设置返回数据的content-type
        _sessionManger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", nil];
        _sessionManger.responseSerializer = [AFJSONResponseSerializer serializer];
        [[AFNetworkActivityIndicatorManager sharedManager]setEnabled:YES];
    }

    
    return _sessionManger;

}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static LCRequestManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;

}

+ (instancetype)sharedInstance {
    
    return [[super alloc]init];
    
}

+ (void) postWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(ReqSuccessBlock)successBlock failureBlock:(ReqFailureBlock)failureBlock {

    [[LCRequestManager sharedInstance].sessionManger POST:[self dealWithUrl:url] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            [self printObject:responseObject];
            //block回调
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
}

+ (void) getWithUR:(NSString *)url params:(NSDictionary *)param successBlock:(ReqSuccessBlock)successBlock failureBlock:(ReqFailureBlock)failureBlock {

    [[LCRequestManager sharedInstance].sessionManger GET:[self dealWithUrl:url] parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            [self printObject:responseObject];
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    

}

+ (void) uploadFilesWithURL:(NSString *)url params:(NSDictionary *)params files:(NSArray *)files successBlock:(ReqSuccessBlock)successBlock failureBlock:(ReqFailureBlock)failureBlock {

    [[LCRequestManager sharedInstance].sessionManger POST:[self dealWithUrl:url] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull totalFormData) {
        for (UploadFiles *formData in files) {
            
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (successBlock) {
            successBlock(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];
    




}


+ (void)printObject:(NSDictionary *)responseObject{
    if ([NSJSONSerialization isValidJSONObject:responseObject]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"response --> %@",json);
    }
}

+ (NSString *)dealWithUrl:(NSString *)url {
    //url 处理操作
    if ([url hasPrefix:@"http"]) {
        
        return url;
    }
    return [NSString stringWithFormat:@"%@%@",BASE_URL,url];
}


@end
