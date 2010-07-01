//
//  OverlayImageManager.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OverlayImageSet.h"

@interface OverlayImageManager : NSObject {
	NSMutableArray *imageSets;
}

-(NSArray*)allSets;
-(OverlayImageSet*)objectAtIndex:(NSInteger)index;

@end
