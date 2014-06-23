//
//  HumanHero.h
//  expandList
//
//  Created by Dikey on 3/30/14.
//
//

#import <Foundation/Foundation.h>

@interface WAR3NEHero : NSObject

@property (nonatomic,strong) NSArray *deserializedArray;

@property (nonatomic,strong) NSDictionary *selectedArray;

- (NSArray *)getDeserializedArray;

@end
