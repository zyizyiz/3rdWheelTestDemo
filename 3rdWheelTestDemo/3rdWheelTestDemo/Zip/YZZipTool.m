//
//  YZZipTool.m
//  3rdWheelTestDemo
//
//  Created by 张义镇 on 2019/10/19.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "YZZipTool.h"
#import <SSZipArchive/SSZipArchive.h>

@implementation YZZipTool

+ (void)localFileTest:(NSString *)fileName {
    
    NSString *localPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"zip"];
    
    [YZZipTool unzipWithFilePath:localPath];
}


+ (NSString *)unzipWithFilePath:(NSString *)filePath {
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSArray *array = [filePath componentsSeparatedByString:@"."];
    NSString *fileName = array[array.count - 2];
    fileName = [[fileName componentsSeparatedByString:@"/"] lastObject];
    NSString *destinationPath = [cachesPath stringByAppendingPathComponent:fileName];
    BOOL isSuccess = [SSZipArchive unzipFileAtPath:filePath toDestination:destinationPath];
    if (isSuccess) {
        NSLog(@"zip 解压成功");
        return destinationPath;
    }else {
        NSLog(@"zip 解压失败");
        return @"";
    }
    
//    NSString *unzipCompletePath = [destinationPath stringByAppendingPathComponent:fileName];
//
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if (![fileManager fileExistsAtPath:destinationPath]) {
//        NSError *error = nil;
//        [fileManager createDirectoryAtPath:destinationPath withIntermediateDirectories:YES attributes:nil error:&error];
//        if (error) {
//            NSLog(@"创建文件失败");
//            return;
//        }
//    }
//
//    [SSZipArchive unzipFileAtPath:filePath toDestination:destinationPath progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
//    } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
//        if (!succeeded) {
//            [[NSFileManager defaultManager] removeItemAtPath:destinationPath
//                                                       error:nil];
//
//        } else {
//            NSError * error = nil;
//            [[NSFileManager defaultManager] moveItemAtPath:destinationPath
//                                                    toPath:unzipCompletePath
//                                                     error:&error];
//            if (error) {
//                NSLog(@"解压失败");
//            } else {
//                NSLog(@"解压成功");
//            }
//
//        }
//    }];
}

@end
