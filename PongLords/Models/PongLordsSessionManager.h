//
//  PongLordsSessionManager.h
//  PongLords
//
//  Created by Paul Tower on 9/30/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface PongLordsSessionManager : AFHTTPRequestOperationManager

+ (PongLordsSessionManager *)sharedInstance;

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password;

@end
