//
//  BSParseDotComRequestSerializer.h
//  SignificantDates
//
//  Created by Steve Baker on 12/8/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import "AFURLRequestSerialization.h"

@interface BSParseDotComRequestSerializer : AFJSONRequestSerializer

/** overrides super's method in order to append custom parameters
 https://github.com/programmingthomas/AFN2-Play-ground/blob/master/AFN2%20Play%20Ground/AFN2%20Play%20Ground/YahooFinanceRequestSerializer.m
 if parameters is nil, method passes custom parameters to super's method
 */
- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(NSDictionary *)parameters
                                        error:(NSError *__autoreleasing *)error;

/** overrides super's method to help with debugging
 */
- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)URLString
                                parameters:(NSDictionary *)parameters;

@end
