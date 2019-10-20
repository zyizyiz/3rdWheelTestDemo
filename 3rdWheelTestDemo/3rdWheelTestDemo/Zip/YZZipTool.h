//
//  YZZipTool.h
//  3rdWheelTestDemo
//
//  Created by 张义镇 on 2019/10/19.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZZipTool : NSObject

/// 解压本地文件

+ (void)localFileTest:(NSString *)fileName;

+ (NSString *)unzipWithFilePath:(NSString *)filePath;


@end

NS_ASSUME_NONNULL_END
