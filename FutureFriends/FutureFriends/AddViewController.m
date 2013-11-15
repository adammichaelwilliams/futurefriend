//
//  AddViewController.m
//  FutureFriends
//
//  Created by Ricardo Del Toro on 11/14/13.
//  Copyright (c) 2013 Ricardo Del Toro. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController
@synthesize textField;
@synthesize fetchedResultsController;
@synthesize managedObject;


- (IBAction)cancel:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
        
        
    }
    
    return context;
    
}





- (void)viewDidAppear:(BOOL)animated {
    

    [super viewDidAppear:animated];
    
    
    [textField becomeFirstResponder];
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)text {
    
    if (text == textField) {
        
        [self saveNewObject];
        
        
        
    }
    
    return 0;

    
}



- (IBAction)done:(id)sender {
 
    [self saveNewObject];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}


- (void)saveNewObject {
    
    NSManagedObjectContext *context = [self managedObjectContext];

    if (self.managedObject) {
        [self.managedObject setValue:self.textField.text forKey:@"userURL"];
        
    } else {
        // create a new managed object
        NSManagedObjectContext *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetails" inManagedObjectContext:context];
        [newDevice setValue:self.textField.text forKey:@"userURL"];

        
        
    }
    
    NSLog(@"managedObject:%@", managedObject);
    
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error localizedDescription]);
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateTableViewNotification" object:nil];
    
    

    [self dismissViewControllerAnimated:YES completion:nil];

    
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    if (managedObject) {
        
        [self.managedObject setValue:self.textField.text forKey:@"userURL"];
        
        
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
