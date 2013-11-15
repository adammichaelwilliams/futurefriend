//
//  FBEViewController.m
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import "FBEViewController.h"
#import "UIWebViewController.h"
#import "AddViewController.h"



@interface FBEViewController ()

@property (strong) NSMutableArray *friends;


@end

@implementation FBEViewController
@synthesize friends;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpdateTableViewNotification:) name:@"UpdateTableViewNotification" object:nil];

    

        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"UserDetails"];
                
        self.friends = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
  
    NSLog(@"value:%@", friends);
    
  

    
}


- (void)UpdateTableViewNotification:(NSNotification *)UpdateTableViewNotification {
    
    [self->_tableView reloadData];

    
    
    
}



- (IBAction)addButton:(id)sender {
    
    AddViewController *add = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    [self presentViewController:add animated:YES completion:nil];
    
    
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);


    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section   {
    return [friends count];
    

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *myID = @"MY_ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myID];
    
    if (cell == nil) {

        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myID];
        

    }

    
//    [cell.textLabel setText:[NSString stringWithFormat:@"%@ \r%@", [tasks valueForKey:@"name"]];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [friends valueForKey:@"userURL"]]];
    
    

    
    return cell;
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIWebViewController *web = [[UIWebViewController alloc] initWithNibName:@"UIWebViewController" bundle:nil];
    [self presentViewController:web animated:YES completion:nil];
    
}


/*
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
*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




