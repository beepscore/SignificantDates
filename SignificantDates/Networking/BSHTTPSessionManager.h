//
//  BSHTTPSessionManager.h
//  SignificantDates
//
//  Created by Steve Baker on 12/8/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//
// http://i.stack.imgur.com/VXHip.png

#import "AFHTTPSessionManager.h"
@class BSParseDotComRequestSerializer;

@interface BSHTTPSessionManager : AFHTTPSessionManager

/**
 @return a shared instance, not strictly enforced as a singleton
 */
+ (id)sharedInstance;

// designated initializer
- (instancetype)initWithBaseURL:(NSURL *)aUrl
           sessionConfiguration:(NSURLSessionConfiguration *)aConfiguration
              requestSerializer:(BSParseDotComRequestSerializer *)aRequestSerializer;

// override super's designated initializer
- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration;

@end
