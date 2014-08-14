//
//  JsApi.h
//  Sublime Panel
//
//  Created by Joaquin Benitez on 8/13/14.
//  Copyright (c) 2014 Toily. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppController.h"

@interface JsApi : NSObject

@property(strong)AppController *appController;

-(void)showModal:(NSString *)name;
-(void)closeModal;
-(void)sendCommand:(NSString *) evData;

@end

