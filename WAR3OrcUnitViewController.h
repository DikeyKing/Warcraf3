//
//  WAR3OrcUnitViewController.h
//  Warcraft3
//
//  Created by Dikey on 4/8/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3OrcUnitViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UIImageView *image;
    __weak IBOutlet UILabel *level;
    __weak IBOutlet UILabel *cost;
    __weak IBOutlet UILabel *unitType;
    __weak IBOutlet UILabel *attackType;
    __weak IBOutlet UILabel *weaponType;
    __weak IBOutlet UILabel *armonType;
    __weak IBOutlet UILabel *armon;
    __weak IBOutlet UILabel *groundAttack;
    __weak IBOutlet UILabel *airAttack;
    __weak IBOutlet UILabel *life;
    __weak IBOutlet UILabel *lifeRecovery;
    __weak IBOutlet UILabel *mana;
    __weak IBOutlet UILabel *manaRecovery;
    __weak IBOutlet UILabel *attackRange;
    __weak IBOutlet UILabel *dayView;
    __weak IBOutlet UILabel *nightView;
    __weak IBOutlet UILabel *speed;
    __weak IBOutlet UILabel *trainingTime;
    __weak IBOutlet UILabel *trainingPlace;
    __weak IBOutlet UILabel *requirement;
    __weak IBOutlet UILabel *hotKey;
    __weak IBOutlet UILabel *description;
}
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *unitSkillTableView;
@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) NSArray *unitArray;
@property (nonatomic, strong) NSMutableDictionary *unitDic;
@property (nonatomic, assign) int skillNumber;
@property (nonatomic, strong) NSMutableArray *unitSkillArray;
@end
