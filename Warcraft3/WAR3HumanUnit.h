//
//  HumanUnitModel.h
//  expandList
//
//  Created by Dikey on 3/27/14.
//
//

#import <Foundation/Foundation.h>

@interface WAR3HumanUnit : NSObject


@property (nonatomic,strong) NSArray *deserializedArray;

@property (nonatomic,strong) NSDictionary *selectedUnit;
@property (nonatomic,assign) int selectedNumber;

- (NSArray *)getDeserializedArray;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) NSArray *unitArray;
@property (nonatomic, strong) NSMutableDictionary *unitDic;


@property (weak, nonatomic)  UILabel *name;
@property (weak, nonatomic)  UIImageView *image;

@property (weak, nonatomic)  UILabel *description;

@property (weak, nonatomic)  UILabel *attackRange;
@property (weak, nonatomic)  UILabel *dayView;
@property (weak, nonatomic)  UILabel *nightView;
@property (weak, nonatomic)  UILabel *speed;
@property (weak, nonatomic)  UILabel *trianingTime;
@property (weak, nonatomic)  UILabel *trianingPlace;
@property (weak, nonatomic)  UILabel *requirement;
@property (weak, nonatomic)  UILabel *hotKey;
@property (weak, nonatomic)  UILabel *level;
@property (weak, nonatomic)  UILabel *cost;
@property (weak, nonatomic)  UILabel *unitType;
@property (weak, nonatomic)  UILabel *attackType;
@property (weak, nonatomic)  UILabel *weapon;
@property (weak, nonatomic)  UILabel *armonType;
@property (weak, nonatomic)  UILabel *armon;

@property (weak, nonatomic)  UILabel *groundAttack;
@property (weak, nonatomic)  UILabel *airAttack;
@property (weak, nonatomic)  UILabel *life;
@property (weak, nonatomic)  UILabel *lifeRecovery ;
@property (weak, nonatomic)  UILabel *mana;
@property (weak, nonatomic)  UILabel *manaRecovery ;

@end
