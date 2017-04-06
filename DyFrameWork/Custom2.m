//
//  Custom2.m
//  LibraryDemo
//
//  Created by vee on 2017/4/6.
//  Copyright © 2017年 None. All rights reserved.
//

#import "Custom2.h"

NSString * const LIB = @"CONST LIB IN LIB";

@implementation Custom2


- (void)ll
{
    NSLog(@"in library");
}

@end


@implementation NSString (C2)

+ (void)load
{
    printf("load from library");
}

- (void)ll
{
    NSLog(@"in library");
}

@end
