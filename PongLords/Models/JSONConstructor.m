//
//  JSONConstructor.m
//  PongLords
//
//  Created by Paul Tower on 9/30/13.
//  Copyright (c) 2013 Paul Tower. All rights reserved.
//

#import "JSONConstructor.h"

@implementation JSONConstructor

+ (NSDictionary *)constructPlayerJSONWithEmail:(NSString *)email andPassword:(NSString *)password {
    
    return @{@"player":
                 @{@"email":email,
                   @"password":password}
             };
}

@end
