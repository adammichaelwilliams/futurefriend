//
//  UIWebViewController.m
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import "UIWebViewController.h"
#import "FBEAppDelegate.h"

@interface UIWebViewController ()

@end

@implementation UIWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        webView = ((FBEAppDelegate *)[UIApplication sharedApplication].delegate).webView;
        webView.translatesAutoresizingMaskIntoConstraints = NO;

        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)setUrl:(NSString *)url {
    _url = [url mutableCopy];
//    NSURL *nsUrl = [[NSURL alloc] initWithString:url];
//    [webView loadRequest:[[NSURLRequest alloc] initWithURL:nsUrl]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:webView];
    NSDictionary *views = @{@"webView":webView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[webView]|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                                              toItem:navBar attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
                                                              toItem:toolbar attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    

    NSURL *nsUrl = [[NSURL alloc] initWithString:self.url];
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:nsUrl]];


}


- (IBAction)Done:(id)sender {
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"Did you the user as a friend" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    
    [action showInView:self.view];
    
    
    
    
    
    
}
- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


- (IBAction)nextFriend:(id)sender {
    
    
    
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
// delete


    }
    [self dismissViewControllerAnimated:YES completion:nil];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
