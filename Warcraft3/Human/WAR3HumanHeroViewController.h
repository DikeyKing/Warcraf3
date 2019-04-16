//
//  WAR3HumanHeroViewController.h
//  expandList
//
//  Created by Dikey on 3/30/14.
//
//

#import <UIKit/UIKit.h>

@interface WAR3HumanHeroViewController : UIViewController
<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UITableView *heroSkillTableView;

//for description
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

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
