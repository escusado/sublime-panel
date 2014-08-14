//
//  AppController.m
//
//  Created by Joaquin Benitez on 4/22/14.
//  Copyright (c) 2014 Freshout. All rights reserved.
//

#import "AppController.h"
#import "WebViewWindow.h"
#import "JsApi.h"
#import "DesktopApi.h"

@implementation AppController{
    NSMutableDictionary *windows;
    JsApi *jsApi;
}

-(id)init{
    
    windows = [[NSMutableDictionary alloc] init];
    
    jsApi = [[JsApi alloc] init];
    jsApi.appController = self;
    
    self.desktopApi = [[DesktopApi alloc] init];
    
    return self;
}

-(void)initUi{
    self.mainWindow = [self addWindow: @{
                                          @"delgate"     : self,
                                          @"name"        : @"main",
                                          @"windowTitle" : @"Sublime panel",
                                          @"fileName"    : @"main",
                                          @"winHeight"   : [NSNumber numberWithInt: 1440],
                                          @"winWidth"    : [NSNumber numberWithInt: 800],
                                          @"jsApi"       : jsApi
                                        }];
    
}

-(WebViewWindow *)addWindow: (NSDictionary *)config{
    WebViewWindow* tempWindow = [[WebViewWindow alloc] initWithConfig:config];
    [windows setObject:tempWindow forKey:[config objectForKey:@"name"]];
    return tempWindow;
}

/************************************************************** API Callbacks */

-(void)showModal: (NSString *)name{
//    NSLog(@"modal opened %@", name);
    self.currentWindow = [windows objectForKey:name];
    [NSApp runModalForWindow:self.currentWindow.windowController.window];
}

-(void)closeModal{
//    NSLog(@"closed modal");
    [self.currentWindow.windowController.window close];
    self.currentWindow = self.mainWindow;
}

-(void)dispatchCommandOnAllWebViews:(NSString *) evString{
    NSString *command = [[NSString alloc] initWithFormat:@"LocalApi.dispatchCommand('%@');", evString];

    for (id key in windows) {
        WebViewWindow *window = [windows objectForKey:key];
        [[window.webView windowScriptObject] evaluateWebScript:command];
        NSLog(@"dispatched: %@", command);
    }
}

-(void)desktopApiExec:(NSString *) evString{
    NSArray *commandTouple = [[NSArray alloc] init] ;
    commandTouple = [evString componentsSeparatedByString:@"|"];
    SEL command = NSSelectorFromString(commandTouple[0]);
    NSString *result = [self.desktopApi performSelector:command withObject:commandTouple[1]];
    [self dispatchCommandOnAllWebViews:result];
};


@end
