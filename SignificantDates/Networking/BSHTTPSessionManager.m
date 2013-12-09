//
//  BSHTTPSessionManager.m
//  SignificantDates
//
//  Created by Steve Baker on 12/8/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import "BSHTTPSessionManager.h"
#import "BSParseDotComRequestSerializer.h"

static NSString * const kBSParseAPIBaseURLString = @"https://api.parse.com/1/";

@implementation BSHTTPSessionManager

// http://stackoverflow.com/questions/5720029/create-singleton-using-gcds-dispatch-once-in-objective-c
+ (id)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        // call designated initializer
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBSParseAPIBaseURLString]
                                  sessionConfiguration:nil
                                     requestSerializer:[[BSParseDotComRequestSerializer alloc] init]];
    });
    return sharedInstance;
}

#pragma mark - Initializers
// designated initializer
- (instancetype)initWithBaseURL:(NSURL *)aUrl
           sessionConfiguration:(NSURLSessionConfiguration *)aConfiguration
              requestSerializer:(BSParseDotComRequestSerializer *)aRequestSerializer {

    // call super's designated intializer
    self = [super initWithBaseURL:aUrl sessionConfiguration:aConfiguration];
    if (self) {
        self.requestSerializer = aRequestSerializer;
    }
    return self;
}

// override super's designated initializer
- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    // call designated initializer
    return [self initWithBaseURL:url
            sessionConfiguration:configuration
               requestSerializer:nil];
}

@end
