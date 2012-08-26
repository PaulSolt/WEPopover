//
//  WEPopoverAppDelegate.h
//  WEPopover
//
//  Created by Werner Altewischer on 06/11/10.
//  Copyright 2010 Werner IT Consultancy. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class WEPopoverViewController;
@class WEPopoverTableViewController;

@interface WEPopoverAppDelegate : NSObject <UIApplicationDelegate> 

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet WEPopoverTableViewController *viewController;

@property (nonatomic, strong) UINavigationController* nav;

@end

