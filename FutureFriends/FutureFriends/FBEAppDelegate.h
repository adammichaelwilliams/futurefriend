//
//  FBEAppDelegate.h
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class FBEViewController;

@interface FBEAppDelegate : UIResponder <UIApplicationDelegate>



@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;



- (NSURL *)applicationDocumentDirectory;
- (void)saveContext;



@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FBEViewController *viewController;

@end
