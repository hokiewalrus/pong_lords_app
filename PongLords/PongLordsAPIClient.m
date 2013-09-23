//
//  PongLordsAPIClient.m
//  PongLords
//
//  Created by Paul Tower on 9/3/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "PongLordsAPIClient.h"

@implementation PongLordsAPIClient

+ (id)sharedInstance {
    static PongLordsAPIClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[PongLordsAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        // [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

@end
