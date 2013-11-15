//
//  FBEViewController.m
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import "FBEViewController.h"
#import "UIWebViewController.h"



@interface FBEViewController ()

@end

@implementation FBEViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(dataUpdatedInContext:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:nil];
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)addButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add Friend" message:@"Type in the user URL" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
    
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);


    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section   {
    return 9;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *myID = @"MY_ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myID];
    
    if (cell == nil) {

        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:myID];
        

    }

    
    
    
    
    
    return cell;
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIWebViewController *web = [[UIWebViewController alloc] initWithNibName:@"UIWebViewController" bundle:nil];
    [self presentViewController:web animated:YES completion:nil];
    
}



- (void)dataUpdatedInContext:(NSNotification *)notif {
    if (![self isViewLoaded]) {
        return; // do not react if view is unloaded. It will reload itself on next load
    }

    NSSet *inserted = [notif.userInfo objectForKey:NSInsertedObjectsKey];
    NSSet *updated = [notif.userInfo objectForKey:NSUpdatedObjectsKey];
    NSSet *deleted = [notif.userInfo objectForKey:NSDeletedObjectsKey];

    NSMutableSet *set = [NSMutableSet setWithSet:inserted];
    [set unionSet:updated];
    [set unionSet:deleted];

    __block BOOL needReloadData = [set count] > 0;
//    [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
//        if ([obj isKindOfClass:[FXEvent class]]) {
//            needReloadData = YES;
//            *stop = YES;
//        }
//    }];

//    SFLogCInfo(@"Got update notif in FXEventListController: %d", needReloadData);

    if (needReloadData) {
        [_tableView reloadData];
    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




