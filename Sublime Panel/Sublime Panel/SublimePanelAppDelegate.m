//
//  SublimePanelAppDelegate.m
//  Sublime Panel
//
//  Created by Joaquin Benitez on 8/13/14.
//  Copyright (c) 2014 Toily. All rights reserved.
//

#import "SublimePanelAppDelegate.h"
#import "AppController.h"

@implementation SublimePanelAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    self.appController = [[AppController alloc] init];
    [self.appController initUi];
}

@end
