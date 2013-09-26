//
//  TournamentViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/26/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "TournamentViewController.h"

@interface TournamentViewController ()

@end

@implementation TournamentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"IconTournament"]];
        [self.tabBarItem setTitle:NSLocalizedString(@"Tourney", nil)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
