//
//  PongLordsSessionManager.m
//  PongLords
//
//  Created by Paul Tower on 9/30/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "PongLordsSessionManager.h"
#import "JSONConstructor.h"
#import "Player.h"
#import "CurrentPlayer.h"

@implementation PongLordsSessionManager

#pragma mark - Singleton Methods

+ (PongLordsSessionManager *)sharedInstance {
    
    static PongLordsSessionManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[PongLordsSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://pong-lords-staging.herokuapp.com"]];
    });
    
    return _sharedInstance;
}

#pragma mark - Init Methods

- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

#pragma mark - Public Methods

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password {
    
    [self POST:@"/v1/sign_in"
    parameters:[JSONConstructor constructPlayerJSONWithEmail:email andPassword:password]
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
           DLog(@"%@", responseObject);
           NSDictionary *playerDict = responseObject[@"player"];
           Player *newPlayer = [[Player alloc] init];
           newPlayer.firstName = playerDict[@"first_name"];
           newPlayer.lastName = playerDict[@"last_name"];
           newPlayer.nickname = playerDict[@"nickname"];
           if ([[CurrentPlayer sharedInstance] logInWithPlayer:newPlayer]) {
               [[NSNotificationCenter defaultCenter] postNotificationName:kLoggedInNotification object:nil];
           }
       }
       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           DLog(@"Error %i", error.code);
       }];
}

@end
