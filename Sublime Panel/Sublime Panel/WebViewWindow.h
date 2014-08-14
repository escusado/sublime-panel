//
//  WebViewWindow.h
//
//  Created by Joaquin Benitez on 4/22/14.
//  Copyright (c) 2014 Freshout. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

#import "WebViewWindowController.h"

@interface WebViewWindow : NSObject <NSWindowDelegate>

-(id)initWithConfig:(NSDictionary*)config;
-(void)hide;
-(void)show;

@property(strong)NSString *name;
@property(strong)id delegate;

@property(strong)WebView *webView;
@property(strong)WebViewWindowController *windowController;
@property(strong)id jsEnv;

@end
