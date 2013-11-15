//
//  AddViewController.h
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


#define TABLE_NOTIF @"UpdateTableViewNotification"

@interface AddViewController : UIViewController <UITextFieldDelegate>  {
    
    IBOutlet UINavigationBar *navBar;
    
    IBOutlet UITextField *textField;
    
    
    NSFetchedResultsController *fetchedResultsController;
    NSManagedObject *managedObject;
    
    NSManagedObjectContext *managedObjectContext;
    
    
    
}

@property(nonatomic, retain)    IBOutlet UITextField *textField;


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@property (strong) NSManagedObject *managedObject;








- (IBAction)cancel:(id)sender;

- (IBAction)done:(id)sender;


@end
