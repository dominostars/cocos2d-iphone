//
//  CCColorTo.m
//  spellcaster
//
//  Created by Gilad Gurantz on 6/28/13.
//
//

#import "CCActionColor.h"

@implementation CCColorTo

+(id) actionWithDuration: (ccTime) t color: (ccColor3B) color
{
	return [[[self alloc] initWithDuration:t color:color ] autorelease];
}

-(id) initWithDuration: (ccTime) t color: (ccColor3B) color
{
	if( (self=[super initWithDuration: t]) )
		endColor_ = color;
    
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] color: endColor_];
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
    NSAssert([aTarget conformsToProtocol:@protocol(CCRGBAProtocol)], @"Running color action on target with no color attribute");
    
    startColor_ = [(id<CCRGBAProtocol>)_target color];
}

-(void) update: (ccTime) t
{
    [(id<CCRGBAProtocol>)_target setColor:ccc3(startColor_.r + (endColor_.r - startColor_.r) * t,
                                               startColor_.g + (endColor_.g - startColor_.g) * t,
                                               startColor_.b + (endColor_.b - startColor_.b) * t)];
}

@end
