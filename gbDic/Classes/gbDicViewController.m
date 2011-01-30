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

- (IBAction)searchTouched : (id)sender
{
  NSLog(@"button touched =)");
  [prgView startAnimating]; // start searching 
  NSString *qword = queryWord.text;
  if ([qword length] == 0)
  {
    NSLog(@"no text");
  } else {
    NSLog(@"%@", qword);
    // sqlite로 내부 검색
    if (NO)  
    {
      // 검색 결과가 있으면 
      //[self sqliteSearch someargs
    } else {
      // google search
      [self webSearch];
    }
  }
  [prgView stopAnimating];
}

- (void)webSearch
{
  NSString *fromLang = @"en"; 
  NSString *toLang = @"ko";
  NSString *qword = queryWord.text;
  
  NSString *urlString = [NSString stringWithFormat:
   @"http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=%@&sl=%@&tl=%@&restrict=pr,de&client=te", qword, fromLang, toLang ];
  //NSLog(urlString);
  //웹에서 가져오기
  NSString *jsonRaw = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];

  if ([jsonRaw length] == 0)
  {
    NSLog(@"json get failed");
    return;
  } 
  //else JSON결과가 있는 경우에만 
  //콜백함수와 슬래시 이상한 것 제거 
  jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@"dict_api.callbacks.id100(" withString:@""];
  jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@",200,null)" withString:@""];
  jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@"\\" withString:@""];
  
  
  // Parse the string into JSON -------------------------
  NSDictionary *json = [jsonRaw JSONValue];
  NSLog(@"parse ok --------------------------------------------------------- ");
  //jsonRaw = [NSString stringWithFormat:@"qweqwe%@asdasd", [json objectForKey:@"webDefinitions"]];
  //jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@"qweqwe(" withString:@""];
  //jsonRaw = [jsonRaw stringByReplacingOccurrencesOfString:@")asdasd" withString:@""];
//  NSLog(@"%@", 
  NSDictionary *json2 = [json objectForKey:@"webDefinitions"];  
 //       );
  //json = [jsonRaw JSONValue];
  
  NSLog(@"parse ok --------------------------------------------------------- ");

  for (id key in json2) {
    NSLog(@"key: %@, value: %@", key, [json2 objectForKey:key]);
  }
  
  dicResultText.text = jsonRaw;
  /* 이부분은 아직 미완성 
   
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
  */
  
  //sqlite결과 저장
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  dicResultText.font = [UIFont fontWithName:@"Arial" size:14.0f];
  
    //resulttext = [NSString stringWithFormat:@"%@%@", resulttext, [[item objectForKey:@"entries"] objectForKey:<#(id)aKey#>
  
  // ----------------------------------------------------
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
