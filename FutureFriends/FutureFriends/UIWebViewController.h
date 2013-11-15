//
//  UIWebViewController.h
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebViewController : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate>  {
    
    IBOutlet UINavigationBar *navBar;
    
    
}

- (IBAction)Done:(id)sender;
- (IBAction)cancel:(id)sender;


@end
