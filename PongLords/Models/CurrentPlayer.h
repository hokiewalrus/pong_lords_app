//
//  CurrentPlayer.h
//  PongLords
//
//  Created by Paul Tower on 10/14/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface CurrentPlayer : Player

@property (nonatomic) NSArray *recentPlayers;

+ (CurrentPlayer *)sharedInstance;

- (BOOL)logInWithPlayer:(Player *)newPlayer;

@end