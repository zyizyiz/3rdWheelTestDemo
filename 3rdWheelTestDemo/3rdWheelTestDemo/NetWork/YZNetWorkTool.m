//
//  YZNetWorkTool.m
//  3rdWheelTestDemo
//
//  Created by 张义镇 on 2019/10/19.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "YZNetWorkTool.h"
#import <AFNetworking/AFNetworking.h>

@implementation YZNetWorkTool

+ (void)downloadWithFileUrl:(NSString *)fileUrl completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fileUrl]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    NSURLSessionDownloadTask *downLoad = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentsDirectoryUrl = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryUrl URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completionHandler(response,filePath,error);
    }];
    [downLoad resume];
}

@end
