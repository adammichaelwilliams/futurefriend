//
//  FBEViewController.h
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface FBEViewController : UIViewController <UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    
    
    IBOutlet UINavigationBar *navBar;

    IBOutlet UITableView *_tableView;

    
    
}

- (IBAction)addButton:(id)sender;



@end
