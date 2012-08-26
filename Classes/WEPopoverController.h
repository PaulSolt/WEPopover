//
//  PopupViewController.h
//  WEPopover
//
//  Created by Werner Altewischer on 02/09/10.
//  Copyright 2010 Werner IT Consultancy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WEPopoverContainerView.h"

@class WEPopoverController;

@protocol PopoverControllerDelegate<NSObject>

- (void)popoverControllerDidDismissPopover:(WEPopoverController *)popoverController;
- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)popoverController;

@end

@interface WEPopoverController : NSObject {
	UIViewController *contentViewController;
	UIView *__weak view;
	
	BOOL popoverVisible;
	UIPopoverArrowDirection popoverArrowDirection;
	id <PopoverControllerDelegate> __unsafe_unretained delegate;
	CGSize popoverContentSize;
	WEPopoverContainerViewProperties *containerViewProperties;
	id <NSObject> context;
    
    UITapGestureRecognizer *tapGesture;
    UIView *parentView;
}

@property(nonatomic) UIViewController *contentViewController;

@property (weak, nonatomic, readonly) UIView *view;
@property (nonatomic, readonly, getter=isPopoverVisible) BOOL popoverVisible;
@property (nonatomic, readonly) UIPopoverArrowDirection popoverArrowDirection;
@property (nonatomic, unsafe_unretained) id <PopoverControllerDelegate> delegate;
@property (nonatomic, assign) CGSize popoverContentSize;
@property (nonatomic) WEPopoverContainerViewProperties *containerViewProperties;
@property (nonatomic) id <NSObject> context;

- (id)initWithContentViewController:(UIViewController *)theContentViewController;

- (void)dismissPopoverAnimated:(BOOL)animated;

- (void)presentPopoverFromRect:(CGRect)rect 
						inView:(UIView *)view 
	  permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections 
					  animated:(BOOL)animated;

- (void)repositionPopoverFromRect:(CGRect)rect
		 permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections;

- (void)parentViewTapped:(UITapGestureRecognizer *)tapGesture;
@end
