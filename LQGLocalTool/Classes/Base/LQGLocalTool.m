//
//  LQGLocalTool.m
//  LQGLocalTool
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "LQGLocalTool.h"

@implementation LQGLocalTool

+ (NSString *)filePathWithSearchPath:(SearchPath)searchPath
                          folderName:(NSString *)folderName
                            fileName:(NSString *)fileName {
    // 1.获取文件夹路径
    NSString *folderPath = [self folderPathWithSearchPath:searchPath folderName:folderName];
    // 2.创建文件夹
    BOOL createFolderSuccess = [self createFolderWithFolderPath:folderPath];
    if (createFolderSuccess) {
        // 3.拼接文件路径
        return [folderPath stringByAppendingPathComponent:fileName];
    }
    return nil;
}

+ (NSString *)folderPathWithSearchPath:(SearchPath)searchPath
                            folderName:(NSString *)folderName {
    NSString *folderPath;
    switch (searchPath) {
        case SearchPathDocuments:
            folderPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
            break;
        case SearchPathLibraryPreferences:
            folderPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
            break;
        case SearchPathLibraryCaches:
            folderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
            break;
        case SearchPathTmp:
            folderPath = NSTemporaryDirectory();
            break;
        default:
            break;
    }
    if (folderName.length) {
        folderPath = [folderPath stringByAppendingPathComponent:folderName];
    }
    return folderPath;
}

+ (BOOL)createFolderWithFolderPath:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist, isDirectory;
    isExist = [fileManager fileExistsAtPath:folderPath isDirectory:&isDirectory];
    if (!isExist ||
        !isDirectory) {
        NSError *error = nil;
        [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&error];
        return error ? NO : YES;
    }
    return YES;
}

@end
