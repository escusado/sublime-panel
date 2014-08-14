//
//  main.m
//  Sublime Panel
//
//  Created by Joaquin Benitez on 8/13/14.
//  Copyright (c) 2014 Toily. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[])
{
    
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"WebKitDeveloperExtras"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return NSApplicationMain(argc, argv);
}
