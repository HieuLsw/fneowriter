//
//  rummikub_timerAppDelegate.h
//  rummikub_timer
//
//  Created by Bright Choe on 11. 1. 31..
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface rummikub_timerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
