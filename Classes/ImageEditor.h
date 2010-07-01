//
//  ImageEditor.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageEditor : NSObject {

}

+(UIImage*)image:(UIImage*)base overlay:(UIImage*)overlay;
+(UIImage*)image:(UIImage*)base resize:(CGSize)size;

@end
