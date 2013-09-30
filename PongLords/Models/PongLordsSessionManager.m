//
//  PongLordsSessionManager.m
//  PongLords
//
//  Created by Paul Tower on 9/30/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "PongLordsSessionManager.h"
#import "JSONConstructor.h"

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

#pragma marl - Public Methods

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password {
    
    [self POST:@"/v1/sign_in"
    parameters:[JSONConstructor constructPlayerJSONWithEmail:email andPassword:password]
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
           DLog(@"%@", responseObject);
       }
       failure:^(AFHTTPRequestOperation *operation, NSError *error) {}];
}

@end
