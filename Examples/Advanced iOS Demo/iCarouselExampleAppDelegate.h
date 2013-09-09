//
//  iCarouselExampleAppDelegate.h
//  iCarouselExample
//
//  Created by Hiromasa Suzuki on 03/04/2011.
//  Copyright 2013 Suzuki Hiromasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCarouselExampleViewController;

@interface iCarouselExampleAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet iCarouselExampleViewController *viewController;

@end
