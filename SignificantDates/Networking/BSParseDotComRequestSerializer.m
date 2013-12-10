//
//  BSParseDotComRequestSerializer.m
//  SignificantDates
//
//  Created by Steve Baker on 12/8/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import "BSParseDotComRequestSerializer.h"

// for request header
// http://www.raywenderlich.com/15916/how-to-synchronize-core-data-with-a-web-service-part-1#comments
static NSString * const kBSParseAPIApplicationId = @"L8X2aqovWtztRucTduRgUSaIdqGB76olK0TeUFTn";
static NSString * const kBSParseRestAPIKey = @"8mcjeFXrxdu3cgdeK1O41GOIMXjjPdXfIZTh0DqB";

@implementation BSParseDotComRequestSerializer

#pragma mark - Initializers

-(NSURLRequest*)requestBySerializingRequest:(NSURLRequest *)request
                             withParameters:(NSDictionary *)parameters
                                      error:(NSError *__autoreleasing *)error
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary
                                               dictionaryWithDictionary:@{@"X-Parse-Application-Id": kBSParseAPIApplicationId,
                                                                          @"X-Parse-REST-API-Key": kBSParseRestAPIKey}];
    // avoid potential null argument exception
    if (parameters) {
        [mutableParameters addEntriesFromDictionary:parameters];
    }

    // change type from NSMutableDictionary to NSDictionary
    NSDictionary *extendedParameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    // NSLog(@"extendedParameters %@", extendedParameters);

    NSLog(@"self.HTTPRequestHeaders %@", self.HTTPRequestHeaders);

    // TODO: clearAuthorizationHeader has no effect here?
    [self clearAuthorizationHeader];
    
    return [super requestBySerializingRequest:request
                               withParameters:extendedParameters
                                        error:error];
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [super requestWithMethod:method
                                                  URLString:URLString
                                                 parameters:parameters];
    return request;
}

@end
