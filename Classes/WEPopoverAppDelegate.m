//
//  WEPopoverAppDelegate.m
//  WEPopover
//
//  Created by Werner Altewischer on 06/11/10.
//  Copyright 2010 Werner IT Consultancy. All rights reserved.
//

#import "WEPopoverAppDelegate.h"
#import "WEPopoverTableViewController.h"

@implementation WEPopoverAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

@synthesize nav = _nav;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    // Add the view controller's view to the window and display.
    [self.window addSubview:navController.view];

	[self.window makeKeyAndVisible];

    /* 
     Fix for bug exposed by conversion to ARC:
     
     Previously, the UINavigationController navController was not (auto)released anywhere. Thus, it continued
     to exist after this method exited. That accidental memory leak caused it to still exist later when
     WePopoverTableViewController referenced it with "... self.navigationController ..."
     Thus, the reference worked.
     
     After conversion to ARC, the UINavigationController object is automatically released. 
     This caused the later reference to "self.navigationController" to find "nil" since the object was gone. 
     
     In order to fix this, we have to retain the created navigation controller somewhere (thus replicating the
     accidental retention in pre-ARC code).
     
     Note: this line retains the navigation controller's *view*, but not the navigation controller itself:
        [self.window addSubview:navController.view];
     */
    // Retain navigation controller:
	self.nav = navController;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}




@end
