//
//  WAR3NEHeroViewController.m
//  expandList
//
//  Created by Dikey on 3/30/14.
//
//

#import "WAR3NEHeroViewController.h"
#import "WAR3NEHero.h"
 
#import "WAR3NEUnitSkillCell.h"

@interface WAR3NEHeroViewController ()
@end

@implementation WAR3NEHeroViewController

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
    _scrollView.ContentSize = CGSizeMake(320, 965);
}

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    _heroSkillTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 300, 320, 750) style:UITableViewStyleGrouped];
    _heroSkillTableView.backgroundColor = [UIColor blackColor];

    [_levelSlider addTarget:self action:@selector(levelSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    _levelSlider.continuous = YES;
    
 
    [_scrollView addSubview:_heroSkillTableView];
    
    UINib *nib = [UINib nibWithNibName:@"WAR3NEUnitSkillCell" bundle:nil];
    [_heroSkillTableView registerNib:nib forCellReuseIdentifier:@"WAR3NEHeroSkillCell"];
    
    _heroSkillTableView.delegate = self;
    _heroSkillTableView.dataSource = self;
    
    [super viewDidLoad];
    [_scrollView setDelegate:self];
    
    // Do any additional setup after loading the view from its nib.
    
    WAR3NEHero *neUnit = [WAR3NEHero new];
    [neUnit deserializedArray];
    
    _heroArray = neUnit.deserializedArray;
    _heroDic = neUnit.deserializedArray[_selectedRow];

    [_description setText:[_heroDic objectForKey:@"description"]];
    [_name setText:[_heroDic objectForKey:@"name"]];
    [_strength setText:[_heroDic objectForKey:@"str"]];
    [_dexterity setText:[_heroDic objectForKey:@"dex"]];
    [_intelligence setText:[_heroDic objectForKey:@"int"]];
    [_property setText:[_heroDic objectForKey:@"property"]];
    [_hotKey setText:[_heroDic objectForKey:@"hotKey"]];
    [_speed setText:[_heroDic objectForKey:@"speed"]];
    [_attackInterval setText:[_heroDic objectForKey:@"attackInterval"]];
    
    _attack.text = [_heroDic objectForKey:@"attack1"];
    _armon.text = [_heroDic objectForKey:@"armon1"];
    _life.text = [_heroDic objectForKey:@"life1"];
    _mana.text = [_heroDic objectForKey:@"mana1"];
    
    UIImage *image = [UIImage imageNamed:[_heroDic objectForKey:@"imageName"]];
    [_image setImage:image];



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
    
    if ([tableView isEqual:_heroSkillTableView]) {
        result = 4;
    }
    
    return result;
 }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WAR3NEUnitSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAR3NEHeroSkillCell"];
    
    if ([tableView isEqual:_heroSkillTableView]) {
        if (cell) {
            NSArray *skillArray = @[[_heroDic objectForKey:@"skill1"],[_heroDic objectForKey:@"skill2"],[_heroDic objectForKey:@"skill3"],[_heroDic objectForKey:@"skill4"]];
            cell.skillName.text = [skillArray objectAtIndex:indexPath.row];
            
            skillArray = @[[_heroDic objectForKey:@"skill1description"],[_heroDic objectForKey:@"skill2description"],[_heroDic objectForKey:@"skill3description"],[_heroDic objectForKey:@"skill4description"]];
            cell.description.text = [skillArray objectAtIndex:indexPath.row];
            
            
            
            
            
            skillArray = @[[_heroDic objectForKey:@"skill1detail"],[_heroDic objectForKey:@"skill2detail"],[_heroDic objectForKey:@"skill3detail"],[_heroDic objectForKey:@"skill4detail"]];
            cell.skillDetail.text = [skillArray objectAtIndex:indexPath.row];
            //cell.skillDetail.frame 无法设定？
            cell.skillDetail.autoresizingMask = YES;
            cell.skillDetail.font =[UIFont boldSystemFontOfSize:14];
            cell.skillDetail.numberOfLines = 0;
            
            skillArray = @[[UIImage imageNamed:[_heroDic objectForKey:@"skill1image"]],[UIImage imageNamed:[_heroDic objectForKey:@"skill2image"]],[UIImage imageNamed:[_heroDic objectForKey:@"skill3image"]],[UIImage imageNamed:[_heroDic objectForKey:@"skill4image"]]];
            cell.skillImage.image =[skillArray objectAtIndex:indexPath.row];            
        }
    }
    _heroSkillTableView.allowsSelection = NO;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_heroSkillTableView]) {
         return NO;
    }
    return  NO;
 }

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *result = nil;
    
    if ([tableView isEqual:_heroSkillTableView] && section==0 ) {
        result = [[UILabel alloc]initWithFrame:CGRectZero];
        result.text = @"Hero Skills";
        result.backgroundColor = [UIColor clearColor];
        [result sizeToFit];
    }
    
    return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

-(void)levelSliderValueChanged:(UISlider*)paramSlider
{
    int level= [[[NSNumber alloc]initWithFloat:paramSlider.value] intValue];
    
    NSArray *heroPropertyArray = @[[_heroDic objectForKey:@"attack1"],[_heroDic objectForKey:@"attack2"],[_heroDic objectForKey:@"attack3"],[_heroDic objectForKey:@"attack4"],[_heroDic objectForKey:@"attack5"],[_heroDic objectForKey:@"attack6"],[_heroDic objectForKey:@"attack7"],[_heroDic objectForKey:@"attack8"],[_heroDic objectForKey:@"attack9"],[_heroDic objectForKey:@"attack10"]];
     _attack.text = heroPropertyArray[level];
    
    heroPropertyArray = @[[_heroDic objectForKey:@"armon1"],[_heroDic objectForKey:@"armon2"],[_heroDic objectForKey:@"armon3"],[_heroDic objectForKey:@"armon4"],[_heroDic objectForKey:@"armon5"],[_heroDic objectForKey:@"armon6"],[_heroDic objectForKey:@"armon7"],[_heroDic objectForKey:@"armon8"],[_heroDic objectForKey:@"armon9"],[_heroDic objectForKey:@"armon10"]];
     _armon.text = heroPropertyArray[level];

    heroPropertyArray = @[[_heroDic objectForKey:@"life1"],[_heroDic objectForKey:@"life2"],[_heroDic objectForKey:@"life3"],[_heroDic objectForKey:@"life4"],[_heroDic objectForKey:@"life5"],[_heroDic objectForKey:@"life6"],[_heroDic objectForKey:@"life7"],[_heroDic objectForKey:@"life8"],[_heroDic objectForKey:@"life9"],[_heroDic objectForKey:@"life10"]];
    _life.text = heroPropertyArray[level];

    heroPropertyArray = @[[_heroDic objectForKey:@"mana1"],[_heroDic objectForKey:@"mana2"],[_heroDic objectForKey:@"mana3"],[_heroDic objectForKey:@"mana4"],[_heroDic objectForKey:@"mana5"],[_heroDic objectForKey:@"mana6"],[_heroDic objectForKey:@"mana7"],[_heroDic objectForKey:@"mana8"],[_heroDic objectForKey:@"mana9"],[_heroDic objectForKey:@"mana10"]];
    _mana.text = heroPropertyArray[level];

    _level.text = [NSString stringWithFormat:@"%d",level+1];
}

@end
