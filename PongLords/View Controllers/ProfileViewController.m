//
//  ProfileViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/3/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (nonatomic) BOOL shouldLoad;

@end

@implementation ProfileViewController

#pragma mark - Init Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"IconProfile"]];
        [self.tabBarItem setTitle:NSLocalizedString(@"Profile", nil)];
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.shouldLoad = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self checkAndLoadModal];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Login View Delegate

- (void)dismissLogin {
    
    self.shouldLoad = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Methods

- (void)checkAndLoadModal {
    
    if (self.shouldLoad) {
        LoginViewController *login = [[LoginViewController alloc] init];
        [login setDelegate:self];
        [login setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:login animated:YES completion:nil];
    }
}

@end
