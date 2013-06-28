//
//  CCColorTo.h
//  spellcaster
//
//  Created by Gilad Gurantz on 6/28/13.
//
//

#import "CCActionInterval.h"

@interface CCColorTo : CCActionInterval
{
    ccColor3B startColor_;
    ccColor3B endColor_;
}

+(id) actionWithDuration: (ccTime) t color: (ccColor3B) color;
-(id) initWithDuration: (ccTime) t color: (ccColor3B) color;

@end
