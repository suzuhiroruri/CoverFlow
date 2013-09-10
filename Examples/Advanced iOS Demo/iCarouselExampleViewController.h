//
//  iCarouselExampleViewController.h
//  iCarouselExample
//
//  Created by Hiromasa Suzuki on 03/04/2011.
//  Copyright 2013 Suzuki Hiromasa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"


@interface iCarouselExampleViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;


//@property (nonatomic, strong) IBOutlet UINavigationItem *navItem;
//@property (nonatomic, strong) IBOutlet UIBarItem *orientationBarItem;
//@property (nonatomic, strong) IBOutlet UIBarItem *wrapBarItem;

//- (IBAction)switchCarouselType;
//- (IBAction)toggleOrientation;
//- (IBAction)toggleWrap;
//- (IBAction)insertItem;
//- (IBAction)removeItem;

@end
