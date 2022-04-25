//
//  LQGLocalTool.h
//  LQGLocalTool
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 SearchPath沙盒路径
 
 - SearchPathDocuments: Documents
 - SearchPathLibraryPreferences: Library/Preferences
 - SearchPathLibraryCaches: Library/Caches
 - SearchPathTmp: Tmp
 */
typedef NS_ENUM(NSInteger, SearchPath) {
    SearchPathDocuments = 0,
    SearchPathLibraryPreferences = 1,
    SearchPathLibraryCaches = 2,
    SearchPathTmp = 3,
};

/// 本地工具类
@interface LQGLocalTool : NSObject

/// 文件路径
/// @param searchPath 沙盒路径类型
/// @param folderName 文件夹名称
/// @param fileName 文件名称
+ (NSString *)filePathWithSearchPath:(SearchPath)searchPath
                          folderName:(NSString *)folderName
                            fileName:(NSString *)fileName;

@end
