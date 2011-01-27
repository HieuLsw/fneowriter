//
//  cocos2d_test1AppDelegate.h
//  cocos2d_test1
//
//  Created by Yong-uk Choe on 11. 1. 27..
//  Copyright none 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface cocos2d_test1AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
