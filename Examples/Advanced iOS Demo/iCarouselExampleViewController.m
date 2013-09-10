//
//  iCarouselExampleViewController.m
//  iCarouselExample
//
//  Created by Hiromasa Suzuki on 03/04/2011.
//  Copyright 2013 Suzuki Hiromasa. All rights reserved.
//

#import "iCarouselExampleViewController.h"


@interface iCarouselExampleViewController () <UIActionSheetDelegate>

@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, strong) NSMutableArray *items;

@end


@implementation iCarouselExampleViewController

@synthesize carousel;

//@synthesize navItem;
//@synthesize orientationBarItem;
//@synthesize wrapBarItem;
@synthesize wrap;
@synthesize items;


- (void)setUp
{
    //set up data
    //端までいったときに最初にループするようにする
    wrap = YES;
    self.items = [NSMutableArray array];
    
    //カバーフローの画像の数の設定をする
    for (int i = 0; i < 1000; i++)
    {
        [items addObject:@(i)];
    }
}


//xibファイルからロードする
//UIViewControllerのためのイニシャライザーである。
//コードでUIViewControllerを作成する時に呼び出されるイニシャライザーである。
//nibをロードできるようUIViewControllerを設定するイニシャライザーである

//このメソッドが呼ばれた時点では…
//outletやactionは設定されていない状態
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        [self setUp];
    }
    return self;
}


//アーカイブオブジェクトのためのイニシャライザーである。
//nibからオブジェクトをロードする時に呼び出されるイニシャライザーである。
//nibの中に保存されたオブジェクトはアーカイブオブジェクトである。

//このメソッドが呼ばれた時点では…
//nibからオブジェクトが取り出されている(unarchive/deserialize)過程にある
//outletやactionは設定されていない状態
//UIViewControllerのcontextの中で、nibからUIViewControllerが生成される
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setUp];
    }
    return self;
}

//メモリを解放する
- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    carousel.delegate = nil;
    carousel.dataSource = nil;
    
}

#pragma mark -
#pragma mark View lifecycle
//ビューをロードしたときに呼ばれる処理
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    carousel.type = iCarouselTypeCoverFlow2;
    //navItem.title = @"CoverFlow2";
}

//ビューをアンロードした時に呼ばれる処理
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
    //self.navItem = nil;
    //self.orientationBarItem = nil;
    //self.wrapBarItem = nil;
}

//ランドスケープモードの対応
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

//カバーのアニメーションの処理のボタン
/*
- (IBAction)switchCarouselType
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Select Carousel Type"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Linear", @"Rotary", @"Inverted Rotary", @"Cylinder", @"Inverted Cylinder", @"Wheel", @"Inverted Wheel", @"CoverFlow", @"CoverFlow2", @"Time Machine", @"Inverted Time Machine", @"Custom", nil];
    [sheet showInView:self.view];
}
*/

/*
- (IBAction)toggleOrientation
{
    //carousel orientation can be animated
    [UIView beginAnimations:nil context:nil];
    carousel.vertical = !carousel.vertical;
    [UIView commitAnimations];
    
    //update button
   // orientationBarItem.title = carousel.vertical? @"Vertical": @"Horizontal";
}
*/

/*
//ループするようにするかどうかのボタンの処理
- (IBAction)toggleWrap
{
    wrap = !wrap;
    wrapBarItem.title = wrap? @"Wrap: ON": @"Wrap: OFF";
    [carousel reloadData];
}
 */
/*
//新しいデータを挿入する
- (IBAction)insertItem
{
    NSInteger index = MAX(0, carousel.currentItemIndex);
    [items insertObject:@(carousel.numberOfItems) atIndex:index];
    [carousel insertItemAtIndex:index animated:YES];
}
 */
/*

//データを削除する
- (IBAction)removeItem
{
    if (carousel.numberOfItems > 0)
    {
        NSInteger index = carousel.currentItemIndex;
        [items removeObjectAtIndex:index];
        [carousel removeItemAtIndex:index animated:YES];
    }
}
*/

#pragma mark -
#pragma mark UIActionSheet methods
/*
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0)
    {
        //map button index to carousel type
        iCarouselType type = buttonIndex;
        
        //carousel can smoothly animate between types
        [UIView beginAnimations:nil context:nil];
        carousel.type = type;
        [UIView commitAnimations];
        
        //update title
        //navItem.title = [actionSheet buttonTitleAtIndex:buttonIndex];
    }
}
*/

#pragma mark -
#pragma mark iCarousel methods

//カルーセルの数を定める
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [items count];
}


//カルーセルの設定
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        //イメージを取得する
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        label = [[UILabel alloc] initWithFrame:view.bounds];
        
        //カルーセルの背景色を設定する
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [items[index] stringValue];
    
    return view;
}

/*
- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 2;
}
*/

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:50.0f];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = (index == 0)? @"[": @"]";
    
    return view;
}

/*
- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}
*/

- (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return wrap;
        }
        
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        default:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps

//カルーセルを選択(タップ)したときに呼ばれる処理
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (self.items)[index];
    NSLog(@"Tapped view number: %@", item);
}

@end
