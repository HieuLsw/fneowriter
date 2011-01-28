//
//  HelloWorldLayer.m
//  cocos2d_test1
//
//  Created by Yong-uk Choe on 11. 1. 27..
//  Copyright none 2011. All rights reserved.
//

// Import the interfaces
#import "HelloWorldScene.h"
//#import "D";

// HelloWorld implementation
@implementation HelloWorld

//이 신 에서만 작동되는 글로벌 스프라이트 
//CCSprite *player_sprite;
CCSprite *enemy_sprite;
CCSprite *goButton;

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorld *layer = [HelloWorld node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		self.isTouchEnabled = YES;

		enemy_sprite = [CCSprite spriteWithFile:@"enemy.png"];
		enemy_sprite.position = ccp(50, 50);
	
		goButton = [CCSprite spriteWithFile:@"redring.png"];
		goButton.position = ccp(400, 250);
		
		[self addChild:enemy_sprite];
		[self addChild:goButton];
		
	}
	return self;
}

- (void) btnClick
{
	id buttonPushed = [CCScaleBy actionWithDuration:0.1 scale:0.5];
  id buttonBack = [buttonPushed reverse];
  [goButton runAction:[CCSequence	actions:buttonPushed, buttonBack, nil]];
  
	id doJump = [CCJumpBy actionWithDuration:0.5 position:ccp(0, 0) height:50.0f jumps:1];
	id doEaseJump = [CCEaseInOut actionWithAction:doJump rate:3];
  [enemy_sprite runAction:doEaseJump];
}

- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	return YES;
}

- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	
	if (touch)
	{
		
		CGPoint touchedlocation = [[CCDirector sharedDirector] convertToGL: [touch locationInView:touch.view]];
	
		float w = goButton.textureRect.size.width;
		float h = goButton.textureRect.size.height;
		CGRect myRect = CGRectMake(goButton.position.x - (w/2),
								   goButton.position.y - (h/2),
								   w,h);
								   
	
		if(CGRectContainsPoint(myRect, touchedlocation)) 
		{
			// particularSprite touched
			[self btnClick];
			//return kEventHandled;
	
		}
		 
	}
	return YES;
}

-(BOOL)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch * touch = [touches anyObject];
	CGPoint location = [[CCDirector sharedDirector] convertToGL: [touch locationInView:touch.view]];    
	[goButton setPosition:ccp(location.x , location.y )];
	return YES;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
