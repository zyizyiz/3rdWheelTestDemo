//
//  YZNetWorkTool.h
//  3rdWheelTestDemo
//
//  Created by 张义镇 on 2019/10/19.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZNetWorkTool : NSObject

+ (void)downloadWithFileUrl:(NSString *)fileUrl completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;
@end

NS_ASSUME_NONNULL_END
