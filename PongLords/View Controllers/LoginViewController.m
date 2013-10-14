//
//  LoginViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/25/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "LoginViewController.h"
#import "PongLordsSessionManager.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

@interface LoginViewController () {
    
    CGFloat animatedDistance;
}

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
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(gestureTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setDelegate:self];
    [self.view addGestureRecognizer:singleTap];
    
    [self.emailField setDelegate:self];
    [self.passwordField setDelegate:self];
    
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loggedIn)
                                                 name:kLoggedInNotification
                                               object:nil];
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

#pragma mark - Gesture Recognizer Delegate

- (void)gestureTap:(id)sender {
    
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

#pragma mark - UITextfield Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (!IS_IPHONE5) {
        CGRect textFieldRect = [self.view.window convertRect:self.passwordField.bounds fromView:self.passwordField];
        CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
        CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
        CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
        CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
        CGFloat heightFraction = numerator / denominator;
        
        if (heightFraction < 0.0) {
            heightFraction = 0.0;
        }
        else if (heightFraction > 1.0) {
            heightFraction = 1.0;
        }
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
        CGRect viewFrame = self.view.frame;
        viewFrame.origin.y -= animatedDistance;
        
        [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [self.view setFrame:viewFrame];
                         }
                         completion:nil];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (!IS_IPHONE5) {
        CGRect viewFrame = self.view.frame;
        viewFrame.origin.y += animatedDistance;
        
        [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [self.view setFrame:viewFrame];
                         }
                         completion:nil];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == 0) {
        [textField resignFirstResponder];
        [self.passwordField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Private Methods

- (void)loggedIn {
    
    if ([self.delegate respondsToSelector:@selector(dismissLogin)]) {
        [self.delegate dismissLogin];
    }
}

@end
