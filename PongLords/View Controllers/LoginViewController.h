//
//  LoginViewController.h
//  PongLords
//
//  Created by Paul Tower on 9/25/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UIButton *submitButton;
@property (nonatomic, weak) IBOutlet UIButton *forgotPasswordButton;

@end
