//
//  CurrentPlayer.m
//  PongLords
//
//  Created by Paul Tower on 10/14/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "CurrentPlayer.h"

@implementation CurrentPlayer

#pragma mark - Singleton Methods

+ (CurrentPlayer *)sharedInstance {
    
    static CurrentPlayer *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CurrentPlayer alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - Public Methods

- (BOOL)logInWithPlayer:(Player *)newPlayer {
    
    newPlayer.firstName = self.firstName;
    newPlayer.lastName = self.lastName;
    newPlayer.nickname = self.nickname;
    
    return YES;
}

@end
