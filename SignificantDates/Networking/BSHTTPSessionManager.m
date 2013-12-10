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

        // requestSerializer HTTPRequestHeaders don't include basic auth
        //  NSLog(@"sharedInstance requestSerializer HTTPRequestHeaders %@",
        //        [[(BSHTTPSessionManager *)sharedInstance requestSerializer] HTTPRequestHeaders]);
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

// TODO: Fix getHoliday, currently it fails
- (void)getHoliday
{
    [self GET:@"classes/Holiday"
   parameters:nil
      success:^(NSURLSessionDataTask *task, id response){
          NSLog(@"yay, success");
      }
      failure:^(NSURLSessionDataTask *task, NSError *error){
          NSLog(@"error %@", [error description]);
      }];
}

- (void)getHoliday2
{
    // http://www.objc.io/issue-5/from-nsurlconnection-to-nsurlsession.html

    NSString *urlString = @"https://api.parse.com/1/classes/Holiday";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest
                                    requestWithURL:url
                                    cachePolicy:NSURLRequestUseProtocolCachePolicy
                                    timeoutInterval:20];

    // for request header
    // http://www.raywenderlich.com/15916/how-to-synchronize-core-data-with-a-web-service-part-1#comments
    NSString *kParseAPIApplicationId = @"L8X2aqovWtztRucTduRgUSaIdqGB76olK0TeUFTn";
    NSString *kParseRestAPIKey = @"8mcjeFXrxdu3cgdeK1O41GOIMXjjPdXfIZTh0DqB";
    [request addValue:kParseAPIApplicationId forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request addValue:kParseRestAPIKey forHTTPHeaderField:@"X-Parse-REST-API-Key"];

    // TODO: remove singleton from method
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session
                                  dataTaskWithRequest:request
                                  completionHandler:^(NSData *data,
                                                      NSURLResponse *response,
                                                      NSError *error) {
                                      if (error) {
                                          NSLog(@"error %@", error);
                                      } else {
                                          NSLog(@"response %@", response);
                                          
                                          NSString *json = [[NSString alloc] initWithData:data
                                                                                 encoding:NSUTF8StringEncoding];
                                          NSLog(@"json %@", json);
                                      }
                                  }];
    [task resume];
}

@end
