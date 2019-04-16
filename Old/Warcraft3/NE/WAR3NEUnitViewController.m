//
//  WAR3NEUnitViewController.m
//  Warcraft3
//
//  Created by Dikey on 4/25/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3NEUnitViewController.h"
#import "WAR3NEUnit.h"
#import "WAR3NEUnitSkillCell.h"

@interface WAR3NEUnitViewController ()

@end

@implementation WAR3NEUnitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    _scrollView.frame = CGRectMake(0, 0, 320, 500);
    _scrollView.ContentSize = CGSizeMake(320, 465+_skillNumber*140);
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    WAR3NEUnit *neUnit = [WAR3NEUnit new];
    [neUnit deserializedArray];
    
    _unitDic = neUnit.deserializedArray[_selectedRow];
    _unitSkillArray = [_unitDic objectForKey:@"skill"];
    _skillNumber = [_unitSkillArray count];
    
    _unitSkillTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 390, 320, 140*_skillNumber) style:UITableViewStylePlain];
    
    UINib *nib = [UINib nibWithNibName:@"WAR3NEUnitSkillCell" bundle:nil];
    
    [_unitSkillTableView registerNib:nib forCellReuseIdentifier:@"WAR3NEUnitSkillCell"];
    
    
    _unitSkillTableView.delegate = self;
    _unitSkillTableView.dataSource = self;
    
    [self.scrollView addSubview:_unitSkillTableView];
    
    NSDictionary *dic = neUnit.deserializedArray[_selectedRow];
    
    [_name setText:[dic objectForKey:@"name"]];
    UIImage *unitImage = [UIImage imageNamed:[dic objectForKey:@"imageName"]];
    [_image setImage:unitImage];
    
    
    _unitSkillTableView.delegate = self;
    _unitSkillTableView.dataSource = self;
    
    [self.scrollView addSubview:_unitSkillTableView];
    
    _name.text = [_unitDic objectForKey:@"name"];
    UIImage *image = [UIImage imageNamed:[_unitDic objectForKey:@"imageName3"]];
    _image.image = image ;
    
    _description.text = [_unitDic objectForKey:@"description"];
    _attackRange.text = [_unitDic objectForKey:@"attackRange"];
    _dayView.text = [_unitDic objectForKey:@"dayView"];
    _nightView.text = [_unitDic objectForKey:@"nightView"];
    _speed.text = [_unitDic objectForKey:@"speed"];
    _trianingTime.text= [_unitDic objectForKey:@"traningTime"];
    _trianingPlace.text = [_unitDic objectForKey:@"traningPlace"];
    _requirement.text = [_unitDic objectForKey:@"requirement"];
    _hotKey.text = [_unitDic objectForKey:@"hotKey"];
    _level.text = [_unitDic objectForKey:@"level"];
    _cost.text = [_unitDic objectForKey:@"cost"];
    _unitType.text = [_unitDic objectForKey:@"unitType"];
    _attackType.text = [_unitDic objectForKey:@"attackType"];
    _weapon.text = [_unitDic objectForKey:@"weaponType"];
    _armonType.text = [_unitDic objectForKey:@"ArmonType"];
    _armon.text = [_unitDic objectForKey:@"armon"];
    
    _groundAttack.text = [_unitDic objectForKey:@"groundAttack"];
    _airAttack.text = [_unitDic objectForKey:@"airAttack"];
    _life.text = [_unitDic objectForKey:@"life"];
    _lifeRecovery.text = [_unitDic objectForKey:@"lifeRecovery"];
    _mana.text = [_unitDic objectForKey:@"mana"];
    _manaRecovery.text = [_unitDic objectForKey:@"manaRecovery"];
    [self.view setBackgroundColor:[UIColor blackColor]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    
    if ([tableView isEqual:_unitSkillTableView]) {
        result = _skillNumber;
    }
    
    return result;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WAR3NEUnitSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAR3NEUnitSkillCell"];
    
    if ([tableView isEqual:_unitSkillTableView]) {
        
        NSDictionary *skillDic = nil;
        
        NSMutableArray *skillNameArray = [[NSMutableArray alloc]initWithCapacity:_skillNumber];
        NSMutableArray *skillDescriptionArray = [[NSMutableArray alloc]initWithCapacity:_skillNumber];
        NSMutableArray *skillDetailArray = [[NSMutableArray alloc]initWithCapacity:_skillNumber];
        
        NSMutableArray *skillImageArray = [[NSMutableArray alloc]initWithCapacity:_skillNumber];
        
        for (int i=0; i<_skillNumber; i++) {
            skillDic = _unitSkillArray[i];
            
            NSString *str = [skillDic objectForKey:@"skill"];
            [skillNameArray addObject:str];
            str = [skillDic objectForKey:@"skilldescription"];
            [skillDescriptionArray addObject:str];
            
            if ([skillDic objectForKey:@"skilldetail"]!=nil) {
                str = [skillDic objectForKey:@"skilldetail"];
                [skillDetailArray addObject:str];
            }
            
            str = [skillDic objectForKey:@"skillimage"];
            
            UIImage *unitImage = [UIImage imageNamed:[skillDic objectForKey:@"skillimage"]];
            [skillImageArray addObject:unitImage];
        }
        
        if (skillNameArray!=nil) {
            cell.skillName.text = [skillNameArray objectAtIndex:indexPath.row];
        }
        if (skillDescriptionArray!=nil) {
            cell.description.text = [skillDescriptionArray objectAtIndex:indexPath.row];
        }
        
        if (skillDetailArray!=nil)
        cell.skillDetail.text = [skillDetailArray objectAtIndex:indexPath.row];
        
        if (skillImageArray!=nil) {
            cell.skillImage.image = [skillImageArray objectAtIndex:indexPath.row];
        }
    }
    
    cell.tableView =tableView; //这行代码干嘛用的？
    _unitSkillTableView.allowsSelection = NO;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
