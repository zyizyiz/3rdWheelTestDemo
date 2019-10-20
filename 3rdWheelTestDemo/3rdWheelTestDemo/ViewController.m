//
//  ViewController.m
//  3rdWheelTestDemo
//
//  Created by 张义镇 on 2019/10/19.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "ViewController.h"
#import "YZZipTool.h"
#import "YZNetWorkTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 解压本地文件
//    [YZZipTool localFileTest:@"火箭"];
    
    /// 加载本地动画
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"666" ofType:@"bundle"];
//    [self addLottieView:[[NSBundle bundleWithPath:filePath] pathForResource:@"666" ofType:@"json"]];
    
    /// 下载文件并显示动画
       NSString *url1 = @"https://yusheng-1259042727.cos.ap-chengdu.myqcloud.com/effects/%E7%81%AB%E7%AE%AD.zip";
//       NSString *url2 = @"https://yusheng-1259042727.cos.ap-chengdu.myqcloud.com/effects/666.zip";
       [YZNetWorkTool downloadWithFileUrl:url1 completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nonnull filePath, NSError * _Nonnull error) {
           if (error == nil) {
               NSLog(@"下载成功");
               NSString *unzipFilePath = [YZZipTool unzipWithFilePath:filePath.path];

               if (unzipFilePath.length > 0) {
                   dispatch_async(dispatch_get_main_queue(), ^{
                       NSFileManager *manager = [NSFileManager defaultManager];
                       NSDirectoryEnumerator<NSString *> *fileArray = [manager enumeratorAtPath:unzipFilePath];
                       
                       for (NSString *string in fileArray) {
                           if ([string hasSuffix:@".json"]) {

                               [self addLottieView:[NSString stringWithFormat:@"%@/%@",unzipFilePath,string]];
                               break;
                           }
                       }
                   });
               }
           }else {
               NSLog(@"下载失败");
           }
       }];
}

- (void)addLottieView:(NSString *)filePath {
    LOTAnimationView *animationView = [LOTAnimationView animationWithFilePath:filePath];
//    LOTAnimationView *animationView = [LOTAnimationView animationNamed:@"666"];
    animationView.frame = self.view.bounds;
    [self.view addSubview:animationView];
    [animationView play];
    
}

@end
