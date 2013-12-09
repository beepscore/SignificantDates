//
//  BSHTTPSessionManager.m
//  SignificantDates
//
//  Created by Steve Baker on 12/8/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import "BSHTTPSessionManager.h"

static NSString * const kBSParseAPIBaseURLString = @"https://api.parse.com/1/";

@implementation BSHTTPSessionManager

// http://stackoverflow.com/questions/5720029/create-singleton-using-gcds-dispatch-once-in-objective-c
+ (id)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        // call designated initializer
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBSParseAPIBaseURLString]
                                  sessionConfiguration:nil];
    });
    return sharedInstance;
}

@end
