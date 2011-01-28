//
//  gbDicAppDelegate.h
//  gbDic
//
//  Created by Bright Choe on 11. 1. 28..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class gbDicViewController;

@interface gbDicAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    gbDicViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet gbDicViewController *viewController;

@end

