//
//  iCarouselExampleAppDelegate.m
//  iCarouselExample
//
//  Created by Hiromasa Suzuki on 03/04/2011.
//  Copyright 2013 Suzuki Hiromasa. All rights reserved.
//

#import "iCarouselExampleAppDelegate.h"
#import "iCarouselExampleViewController.h"

@implementation iCarouselExampleAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}


@end
