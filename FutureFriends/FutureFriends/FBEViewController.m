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






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




