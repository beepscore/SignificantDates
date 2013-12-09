//
//  BSHTTPSessionManager.h
//  SignificantDates
//
//  Created by Steve Baker on 12/8/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface BSHTTPSessionManager : AFHTTPSessionManager

/**
 @return a shared instance, not strictly enforced as a singleton
 */
+ (id) sharedInstance;

@end
