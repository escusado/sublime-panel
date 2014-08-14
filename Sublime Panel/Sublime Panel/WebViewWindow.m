//
//  WebViewWindow.m
//
//  Created by Joaquin Benitez on 4/22/14.
//  Copyright (c) 2014 Freshout. All rights reserved.
//

#import <WebKit/WebKit.h>

#import "WebViewWindow.h"
#import "WebViewWindowController.h"

@implementation WebViewWindow

-(id)initWithConfig:(NSDictionary*)config{
    
    self.delegate = [config objectForKey:@"delegate"];
    self.name     = [config objectForKey:@"name"];
    
    NSString *windowTitle = [config objectForKey:@"windowTitle"];
    NSString *fileName    = [config objectForKey:@"fileName"];

    int winHeight = [[config objectForKey:@"winHeight"] intValue];
    int winWidth  = [[config objectForKey:@"winWidth"]  intValue];
    
    id jsApi = [config objectForKey:@"jsApi"];
    
    self.windowController = [[WebViewWindowController alloc] initWithWindowNibName:@"WebViewWindowController"];
    [self.windowController.window setTitle:windowTitle];
    [self.windowController.window setDelegate:self];
    
    [self.windowController.window setFrame: NSMakeRect(0, 0, winHeight, winWidth) display: YES];
    [self.windowController.window setStyleMask: [self.windowController.window styleMask] & ~NSResizableWindowMask];
    [self.windowController.window center];
    
    self.webView = [[WebView alloc] initWithFrame:NSMakeRect(1, 1, 1, 1)];
    
    NSURL *indexFileUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:@"html" inDirectory:@"web-app"]];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:indexFileUrl];

    [self.webView.mainFrame loadRequest:nsrequest];
    [self.windowController.window setContentView:self.webView];

    self.jsEnv = [self.webView windowScriptObject];
    [self.jsEnv setValue:jsApi forKey:@"NativeApi"];
    
    NSLog(@"New window on: %@", fileName);
    
    return self;
}

-(void)windowWillClose:(NSNotification *)notification{
    [NSApp stopModal];
}

-(void)hide{
    [self.windowController.window orderOut:self];
}

-(void)show{
    [self.windowController.window orderFront:self];
}


@end
