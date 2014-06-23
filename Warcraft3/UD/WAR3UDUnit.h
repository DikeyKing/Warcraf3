//
//  WAR3UDUnit.h
//  Warcraft3
//
//  Created by Dikey on 4/25/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAR3UDUnit : NSObject
@property (nonatomic,strong) NSArray *deserializedArray;

@property (nonatomic,strong) NSDictionary *selectedArray;

- (NSArray *)getDeserializedArray;

@end

 
