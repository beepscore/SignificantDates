//
//  SDCoreDataController.h
//  SignificantDates
//
//  Created by Steve Baker on 12/7/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//
//  Reference SDCoreDataController.h created by Chris Wagner on 5/14/12.
//  http://www.raywenderlich.com/15916/how-to-synchronize-core-data-with-a-web-service-part-1

#import <Foundation/Foundation.h>

@interface SDCoreDataController : NSObject

+ (id)sharedInstance;

- (NSURL *)applicationDocumentsDirectory;

- (NSManagedObjectContext *)masterManagedObjectContext;
- (NSManagedObjectContext *)backgroundManagedObjectContext;
- (NSManagedObjectContext *)newManagedObjectContext;
- (void)saveMasterContext;
- (void)saveBackgroundContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

@end