//
//  LQGLocalTool+YYCache.h
//  LQGLocalTool
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import <LQGLocalTool/LQGLocalTool.h>

@interface LQGLocalTool (YYCache)

/// 读取缓存
/// @param cacheName 表名
/// @param key 主键名
+ (id)readCacheName:(NSString *)cacheName
                key:(NSString *)key;

/// 写入缓存
/// @param cacheName 表名
/// @param key 主键名
/// @param object 缓存对象
+ (void)writeCacheName:(NSString *)cacheName
                   key:(NSString *)key
                object:(id<NSCoding>)object;

@end
