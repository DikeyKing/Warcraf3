//
//  WAR3NeutralHero.h
//  Warcraft3
//
//  Created by Dikey on 5/5/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAR3NeutralHero : NSObject

@property (nonatomic,strong) NSArray *deserializedArray;

@property (nonatomic,strong) NSDictionary *selectedArray;

- (NSArray *)getDeserializedArray;

@end
