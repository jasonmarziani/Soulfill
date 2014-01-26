//
//  SFMacros.m
//  soulfill
//
//  Created by Jason Marziani on 1/26/14.
//  Copyright (c) 2014 little wins llc. All rights reserved.
//

#import "SFMacros.h"

@implementation SFMacros

+(NSString*)encounter
{
    return @"Encounter";
}

+(NSString*)broken
{
    return @"Break";
}

+(NSString*)reveal
{
    return @"Reveal";
}

+(NSString*)context
{
    return @"Context";
}

+(NSString*)questcomplete
{
    return @"Double-tap when [[complete|quest proxy]]";
}

+(float)randomInRange:(float)high andLow:(float)low
{
    return (((float)arc4random()/0x100000000)*(high-low)+low);
}

+(NSString*)parseStringForIncludes:(NSString*)str
{
    return str;
}

@end
