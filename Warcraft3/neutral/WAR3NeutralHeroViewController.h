//
//  WAR3NeutralHeroViewController.h
//  Warcraft3
//
//  Created by Dikey on 5/5/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3NeutralHeroViewController : UIViewController
<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UITableView *heroSkillTableView;

//for description
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) IBOutlet UILabel *strength;
@property (weak, nonatomic) IBOutlet UILabel *dexterity;
@property (weak, nonatomic) IBOutlet UILabel *intelligence;
@property (weak, nonatomic) IBOutlet UILabel *property;
@property (weak, nonatomic) IBOutlet UILabel *hotKey;
@property (weak, nonatomic) IBOutlet UILabel *speed;
@property (weak, nonatomic) IBOutlet UILabel *attackInterval;

//for property
@property (strong, nonatomic) IBOutlet UISlider *levelSlider;
@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *attack;
@property (weak, nonatomic) IBOutlet UILabel *armon;
@property (weak, nonatomic) IBOutlet UILabel *life;
@property (weak, nonatomic) IBOutlet UILabel *mana;

@property (nonatomic,assign) NSInteger selectedRow;
@property (nonatomic,strong) NSMutableDictionary *heroDic;
@property (nonatomic,strong) NSArray *heroArray;

@end
