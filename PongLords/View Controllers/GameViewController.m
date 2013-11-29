//
//  GameViewController.m
//  PongLords
//
//  Created by Paul Tower on 9/26/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "GameViewController.h"
#import "CurrentPlayer.h"

@interface GameViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"IconGame"]];
        [self.tabBarItem setTitle:NSLocalizedString(@"Game", nil)];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	[self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate

#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[CurrentPlayer sharedInstance] recentPlayers] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    return cell;
}

@end
