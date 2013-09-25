//
//  ProfileViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/3/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "ProfileViewController.h"
#import "LoginViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

#pragma mark - Init Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self checkAndLoadModal];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)checkAndLoadModal {
    
    LoginViewController *login = [[LoginViewController alloc] init];
    [login setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:login animated:YES completion:nil];
}

@end
