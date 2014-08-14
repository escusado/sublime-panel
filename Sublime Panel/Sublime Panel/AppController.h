//
//  AppController.h
//
//  Created by Joaquin Benitez on 4/22/14.
//  Copyright (c) 2014 Freshout. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewWindow.h"
#import "DesktopApi.h"

@interface AppController : NSObject

@property(strong)WebViewWindow *mainWindow;
@property(strong)WebViewWindow *currentWindow;
@property(strong)DesktopApi *desktopApi;

-(void)initUi;

-(void)dispatchCommandOnAllWebViews: (NSString *) evString;
-(void)showModal: (NSString *)name;
-(void)closeModal;

-(void)desktopApiExec:(NSString *) evString;

@end
