//
//  WAR3OrcUnitViewController.m
//  Warcraft3
//
//  Created by Dikey on 4/8/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3OrcUnitViewController.h"
#import "WAR3OrcUnit.h"
#import "WAR3OrcUnitSkillCell.h"


@interface WAR3OrcUnitViewController ()

@end

@implementation WAR3OrcUnitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    _scrollView.frame = CGRectMake(0, 0, 320, 550);
    _scrollView.ContentSize = CGSizeMake(320, 465+_skillNumber*140);
}

-(void)viewWillAppear:(BOOL)animated
{
    
    }


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    WAR3OrcUnit *orcUnit = [WAR3OrcUnit new];
    [orcUnit deserializedArray];
    
    _unitDic = orcUnit.deserializedArray[_selectedRow];
    _unitSkillArray = [_unitDic objectForKey:@"skill"];
    _skillNumber = [_unitSkillArray count];
    
    _unitSkillTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 390, 320, 140*_skillNumber) style:UITableViewStylePlain];
    
    UINib *nib = [UINib nibWithNibName:@"WAR3OrcUnitSkillCell" bundle:nil];
    
    [_unitSkillTableView registerNib:nib forCellReuseIdentifier:@"WAR3OrcUnitSkillCell"];
    
    
    _unitSkillTableView.delegate = self;
    _unitSkillTableView.dataSource = self;
    
    [self.scrollView addSubview:_unitSkillTableView];

    NSDictionary *dic = orcUnit.deserializedArray[_selectedRow];
    
    [name setText:[dic objectForKey:@"name"]];
    UIImage *unitImage = [UIImage imageNamed:[dic objectForKey:@"imageName3"]];
    [image setImage:unitImage];
    
    
    [level setText:[dic objectForKey:@"level"]];
    [cost setText:[dic objectForKey:@"cost"]];
    [unitType setText:[dic objectForKey:@"unitType"]];
    [weaponType setText:[dic objectForKey:@"weaponType"]];
    [attackType setText:[dic objectForKey:@"attackType"]];
    [armonType setText:[dic objectForKey:@"ArmonType"]];
    [armon setText:[dic objectForKey:@"armon"]];
    [groundAttack setText:[dic objectForKey:@"groundAttack"]];
    [airAttack setText:[dic objectForKey:@"airAttack"]];
    [life setText:[dic objectForKey:@"life"]];
    [lifeRecovery setText:[dic objectForKey:@"lifeRecovery"]];
    [mana setText:[dic objectForKey:@"mana"]];
    [manaRecovery setText:[dic objectForKey:@"manaRecovery"]];
    [attackRange setText:[dic objectForKey:@"attackRange"]];
    [dayView setText:[dic objectForKey:@"dayView"]];
    [nightView setText:[dic objectForKey:@"nightView"]];
    [speed setText:[dic objectForKey:@"speed"]];
    [trainingTime setText:[dic objectForKey:@"traningTime"]];
    [trainingPlace setText:[dic objectForKey:@"traningPlace"]];
    [requirement setText:[dic objectForKey:@"requirement"]];
    [hotKey setText:[dic objectForKey:@"hotKey"]];
    [description setText:[dic objectForKey:@"description"]];

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
    WAR3OrcUnitSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAR3OrcUnitSkillCell"];
    
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
