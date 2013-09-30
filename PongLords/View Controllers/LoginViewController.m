//
//  LoginViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/25/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "LoginViewController.h"
#import "PongLordsSessionManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    UIColor *placeholderColor = [UIColor colorWithRed:0.937 green:0.282 blue:0.224 alpha:1.000];
	[self.emailField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Email", nil) attributes:@{NSForegroundColorAttributeName: placeholderColor}]];
    [self.passwordField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Password", nil) attributes:@{NSForegroundColorAttributeName: placeholderColor}]];
    
    [self.emailField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)]];
    [self.emailField setLeftViewMode:UITextFieldViewModeAlways];
    [self.passwordField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)]];
    [self.passwordField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIColor *buttonTextColor = [UIColor colorWithRed:0.973 green:0.957 blue:0.922 alpha:1.000];
    
    [self.submitButton setAttributedTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"SUBMIT", nil)
                                                                          attributes:@{NSKernAttributeName:@1, NSForegroundColorAttributeName: buttonTextColor}]
                                 forState:UIControlStateNormal];
    [self.forgotPasswordButton setAttributedTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Forgot Password", nil)
                                                                                  attributes:@{NSUnderlineStyleAttributeName:@1, NSForegroundColorAttributeName: buttonTextColor}]
                                         forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)submitButtonPressed:(id)sender {
    
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [[PongLordsSessionManager sharedInstance] loginWithEmail:self.emailField.text andPassword:self.passwordField.text];
}

@end
