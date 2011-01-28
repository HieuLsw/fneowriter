//
//  gbDicViewController.m
//  gbDic
//
//  Created by Bright Choe on 11. 1. 28..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "gbDicViewController.h"
#import "JSON.h"

@implementation gbDicViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSString *fromLang = @"en";
  NSString *toLang = @"ko";
  NSString *queryWord = @"informer";
  
  NSString *urlString = [NSString stringWithFormat:
                         @"http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=%@&sl=%@&tl=%@&restrict=pr%%2Cde&client=te", 
                         queryWord, fromLang, toLang ];
  //NSLog(urlString);
  
  NSString *jsonRaw = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
  
  if ([jsonRaw length] == 0)
  {
    NSLog(@"json get failed");
    return;
  } 
  jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@"dict_api.callbacks.id100(" withString:@""];
  jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@",200,null)" withString:@""];
  jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@"\\" withString:@""];
  //NSLog(@"%@", jsonRaw);
  
  // Parse the string into JSON
  NSDictionary *json = [jsonRaw JSONValue];
  NSLog(@"parse ok --------------------------------------------------------- ");
  
  // Get all object
  NSArray *items = [json valueForKeyPath:@"primaries"];
  NSLog(@"step1");

  NSArray *item = [[items objectAtIndex:0] objectForKey:@"terms"];
  NSLog(@"step2");
  
  NSArray *item1 = [[item objectAtIndex:0] objectForKey:@"entries"];
  NSLog(@"step3");
  
  NSEnumerator *enumerator = [item1 objectEnumerator];
  NSLog(@"step4");
  
  NSString *resulttext = @"";
  
  while (item1 = (NSDictionary*)[enumerator nextObject]) {
    NSLog(@"e = %@",[item1 objectForKey:@"text"]);    
    //resulttext = [NSString stringWithFormat:@"%@%@", resulttext, [[item objectForKey:@"entries"] objectForKey:<#(id)aKey#>
  }
  /*
  NSArray *array1 = [[items objectAtIndex:1] objectForKey:@"entries"];
  NSLog(@"step2");
  NSEnumerator *enumerator = [array1 objectEnumerator];
  NSLog(@"step3");
  NSDictionary* item;
  while (item = (NSDictionary*)[enumerator nextObject]) {
    NSLog(@"terms = %@",[item objectForKey:@"terms"]);
    //NSLog(@"message = %@",[item objectForKey:@"message"]);
    //NSLog(@"sender  = %@",[item objectForKey:@"sender"]);
  }
  NSLog(@"step5");
   */
  
  //dicResultText.text = jsonRaw;

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
