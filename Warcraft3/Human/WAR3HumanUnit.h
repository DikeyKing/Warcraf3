//
//  HumanUnitModel.h
//  expandList
//
//  Created by Dikey on 3/27/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WAR3HumanUnit : NSObject


@property (nonatomic,strong) NSArray *deserializedArray;

@property (nonatomic,strong) NSDictionary *selectedUnit;
@property (nonatomic,assign) int selectedNumber;

- (NSArray *)getDeserializedArray;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) NSArray *unitArray;
@property (nonatomic, strong) NSMutableDictionary *unitDic;

@property (strong, nonatomic)  UILabel *name;
@property (strong, nonatomic)  UIImageView *image;

@property (strong, nonatomic)  UILabel *descriptionLabel;

@property (strong, nonatomic)  UILabel *attackRange;
@property (strong, nonatomic)  UILabel *dayView;
@property (strong, nonatomic)  UILabel *nightView;
@property (strong, nonatomic)  UILabel *speed;
@property (strong, nonatomic)  UILabel *trianingTime;
@property (strong, nonatomic)  UILabel *trianingPlace;
@property (strong, nonatomic)  UILabel *requirement;
@property (strong, nonatomic)  UILabel *hotKey;
@property (strong, nonatomic)  UILabel *level;
@property (strong, nonatomic)  UILabel *cost;
@property (strong, nonatomic)  UILabel *unitType;
@property (strong, nonatomic)  UILabel *attackType;
@property (strong, nonatomic)  UILabel *weapon;
@property (strong, nonatomic)  UILabel *armonType;
@property (strong, nonatomic)  UILabel *armon;

@property (strong, nonatomic)  UILabel *groundAttack;
@property (strong, nonatomic)  UILabel *airAttack;
@property (strong, nonatomic)  UILabel *life;
@property (strong, nonatomic)  UILabel *lifeRecovery ;
@property (strong, nonatomic)  UILabel *mana;
@property (strong, nonatomic)  UILabel *manaRecovery ;

@end
