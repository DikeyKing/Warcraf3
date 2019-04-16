//
//  HumanUnitModel.h
//  expandList
//
//  Created by Dikey on 3/27/14.
//
//

#import <Foundation/Foundation.h>

@interface WAR3OrcUnit : NSObject


@property (nonatomic,strong) NSArray *deserializedArray;
@property (nonatomic,strong) NSDictionary *selectedUnit;

- (NSArray *)getDeserializedArray;

@end
