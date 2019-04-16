//
//  WAR3HumanUnitViewController.h
//  Warcraft3
//
//  Created by Dikey on 4/10/14.//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3HumanUnitViewController : UIViewController  <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) UITableView *unitSkillTableView;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) NSArray *unitArray;
@property (nonatomic, strong) NSMutableDictionary *unitDic;
@property (nonatomic, assign) int skillNumber;
@property (nonatomic, strong) NSMutableArray *unitSkillArray;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *attackRange;
@property (weak, nonatomic) IBOutlet UILabel *dayView;
@property (weak, nonatomic) IBOutlet UILabel *nightView;
@property (weak, nonatomic) IBOutlet UILabel *speed;
@property (weak, nonatomic) IBOutlet UILabel *trianingTime;
@property (weak, nonatomic) IBOutlet UILabel *trianingPlace;
@property (weak, nonatomic) IBOutlet UILabel *requirement;
@property (weak, nonatomic) IBOutlet UILabel *hotKey;
@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (weak, nonatomic) IBOutlet UILabel *unitType;
@property (weak, nonatomic) IBOutlet UILabel *attackType;
@property (weak, nonatomic) IBOutlet UILabel *weapon;
@property (weak, nonatomic) IBOutlet UILabel *armonType;
@property (weak, nonatomic) IBOutlet UILabel *armon;
@property (weak, nonatomic) IBOutlet UILabel *groundAttack;
@property (weak, nonatomic) IBOutlet UILabel *airAttack;
@property (weak, nonatomic) IBOutlet UILabel *life;
@property (weak, nonatomic) IBOutlet UILabel *lifeRecovery ;
@property (weak, nonatomic) IBOutlet UILabel *mana;
@property (weak, nonatomic) IBOutlet UILabel *manaRecovery ;

@end
