//
//  LCRequestManager.h
//  BaseProjectDemo
//
//  Created by 罗成 on 16/2/22.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *BASE_URL = @"http://192.168.23.60:8080/";
/**
 * 请求成功回调
 *
 *@param responseData
 
 */
typedef void (^ReqSuccessBlock)(id json);

/**
 * 请求失败回调
 *
 *@param error
 
 */
typedef void (^ReqFailureBlock)(NSError *error);


@interface LCRequestManager : NSObject

/**
 *  POST 请求
 *
 *  @param url          url
 *  @param params       param
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
+ (void) postWithURL:(NSString *)url params:(NSDictionary *)params successBlock:(ReqSuccessBlock)successBlock failureBlock:(ReqFailureBlock)failureBlock;

/**
 *  GET 请求
 *
 *  @param url          url
 *  @param params       param
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */

+ (void) getWithUR:(NSString *)url params:(NSDictionary *)param successBlock:(ReqSuccessBlock)successBlock failureBlock:(ReqFailureBlock)failureBlock;

/**
 *  POST 文件上传
 *
 *  @param url          url
 *  @param params       param
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */

+ (void) uploadFilesWithURL:(NSString *)url params:(NSDictionary *)params files:(NSArray *)files successBlock:(ReqSuccessBlock)successBlock failureBlock:(ReqFailureBlock)failureBlock;

@end

@interface UploadFiles : NSObject

@property (nonatomic, strong) NSData *data;  /**< 文件数据 */

@property (nonatomic, copy) NSString *name; /**< 参数名 */

@property (nonatomic, copy) NSString *filename; /**< 文件名 */

@property (nonatomic, copy) NSString *mimeType; /**< 文件类型 */


@end

