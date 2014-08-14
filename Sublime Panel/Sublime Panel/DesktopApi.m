//
//  DesktopApi.m
//  Sublime Panel
//
//  Created by Joaquin Benitez on 8/13/14.
//  Copyright (c) 2014 Toily. All rights reserved.
//

#import "DesktopApi.h"

@implementation DesktopApi{
    
}

-(NSString *)readSettingsFile:(NSString *) evString{
    NSLog(@"CCCCCCommand @%@", evString);
    return @"{\"name\":\"readSettingsFile:result\",\"data\":{\"resultA\":1,\"resultB\":\"zero\"}}";
}

@end
