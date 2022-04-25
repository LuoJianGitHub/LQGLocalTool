//
//  LQGLocalTool+YYCache.m
//  LQGLocalTool
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "LQGLocalTool+YYCache.h"

#import <YYCache/YYCache.h>

@implementation LQGLocalTool (YYCache)

+ (id)readCacheName:(NSString *)cacheName
                key:(NSString *)key {
    return [[YYCache cacheWithName:cacheName] objectForKey:[self key:key]];
}

+ (void)writeCacheName:(NSString *)cacheName
                   key:(NSString *)key
                object:(id<NSCoding>)object {
    [[YYCache cacheWithName:cacheName] setObject:object forKey:[self key:key]];
}

+ (NSString *)key:(NSString *)key {
    return [NSString stringWithFormat:@"key_%@", key ? : @""];
}

@end
