//
//  gbDicViewController.h
//  gbDic
//
//  Created by Bright Choe on 11. 1. 28..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gbDicViewController : UIViewController {

  IBOutlet UITextView *dicResultText;
  IBOutlet UIActivityIndicatorView *prgView;
	IBOutlet UITextField *queryWord;
}

@property (nonatomic, retain) UIActivityIndicatorView *prgView;

- (IBAction)searchTouched : (id)sender;

@end

