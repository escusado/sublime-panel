//
//  JsApi.m
//  Sublime Panel
//
//  Created by Joaquin Benitez on 8/13/14.
//  Copyright (c) 2014 Toily. All rights reserved.
//

#import "JsApi.h"

@implementation JsApi{
    
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector {
    return NO;
}

-(void)showModal:(NSString *)name{
    [self.appController showModal:name];
}

-(void)closeModal{
    //    NSLog(@"closeModal");
    [self.appController closeModal];
}

-(void)sendCommand:(NSString *)evData{
    //    NSLog(@"sendCommand %@", evData);
    [self.appController dispatchCommandOnAllWebViews:evData];
}
@end
