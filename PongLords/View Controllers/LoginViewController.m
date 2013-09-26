//
//  LoginViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/25/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIColor *placeholderColor = [UIColor colorWithRed:0.937 green:0.282 blue:0.224 alpha:1.000];
	[self.emailField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Email", nil) attributes:@{NSForegroundColorAttributeName: placeholderColor}]];
    [self.passwordField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Password", nil) attributes:@{NSForegroundColorAttributeName: placeholderColor}]];
    
    [self.emailField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)]];
    [self.emailField setLeftViewMode:UITextFieldViewModeAlways];
    [self.passwordField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)]];
    [self.passwordField setLeftViewMode:UITextFieldViewModeAlways];
    
    [self.submitButton setAttributedTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"SUBMIT", nil) attributes:@{NSKernAttributeName:@1, NSForegroundColorAttributeName: [UIColor colorWithRed:0.973 green:0.957 blue:0.922 alpha:1.000]}] forState:UIControlStateNormal];
    [self.forgotPasswordButton setAttributedTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Forgot Password", nil) attributes:@{NSUnderlineStyleAttributeName:@1, NSForegroundColorAttributeName: [UIColor colorWithRed:0.973 green:0.957 blue:0.922 alpha:1.000]}] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
