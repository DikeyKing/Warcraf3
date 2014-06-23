//
//  WAR3NeutralViewController.m
//  Warcraft3
//
//  Created by Dikey on 5/5/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3NeutralViewController.h"
#import "WAR3neutralHero.h"
#import "WAR3NeutralHeroViewController.h"

@interface WAR3NeutralViewController ()

@end

@implementation WAR3NeutralViewController


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Neutral";

        
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Did selected row at SECTION %ld,ROW %ld ",(long)indexPath.section,(long)indexPath.row);
    
    if (indexPath.section == 0 ) {
        WAR3NeutralHeroViewController *nhvc= [WAR3NeutralHeroViewController new];
        nhvc.selectedRow = indexPath.row;
        [self.navigationController pushViewController:nhvc animated:YES];
    }

    

}

- (NSInteger)numberOfSections
{
    return 1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    sectionData = [[NSMutableArray alloc]initWithCapacity : 1];
    
    WAR3NeutralHero *neuHero = [[WAR3NeutralHero alloc]init];
    [neuHero getDeserializedArray];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:@"中立英雄" forKey:@"groupname"];
    
    //Arr1 初始化以及个数初始化
    NSMutableArray *arr1 = [[NSMutableArray alloc]initWithCapacity:[neuHero.deserializedArray count]];
    
    //将hero array中的所有名字加入到 arr1 中
    for (int i = 0; i<[neuHero.deserializedArray count]; i++) {
        NSDictionary *dictionary  = neuHero.deserializedArray[i];
        NSString *name = [dictionary objectForKey:@"name"];
        [arr1 addObject:name];
    }
    
    [dict setObject:arr1 forKey:@"name"];
    [sectionData addObject: dict];
    
    /*
    WAR3HumanUnit *humUnit= [[WAR3HumanUnit alloc]init];
    [humUnit getDeserializedArray];
    dict = [[NSMutableDictionary alloc]initWithCapacity : [humUnit.deserializedArray count]];
    [dict setObject:@"人族单位" forKey:@"groupname"];
    NSMutableArray *arr2 = [[NSMutableArray alloc]initWithCapacity:[humUnit.deserializedArray count]];
    for (int i = 0 ; i< [humUnit.deserializedArray count]; i++) {
        NSDictionary *dictionary = humUnit.deserializedArray[i];
        NSString *name = [dictionary objectForKey:@"name"];
        [arr2 addObject:name];
    }
	[dict setObject:arr2 forKey:@"name"];
	[sectionData addObject: dict];
    
    
	dict = [[NSMutableDictionary alloc]initWithCapacity:16];
    [dict setObject:@"人族建筑" forKey:@"groupname"];
    NSMutableArray *arr3 = [[NSMutableArray alloc]initWithObjects:@"城镇大厅",@"要塞",@"城堡",@"兵营",@"伐木场",@"铁匠铺",@"农场",@"国王祭坛", @"神秘圣地",@"车间",@"哨塔",@"防御塔",@"炮塔",@"神秘之塔",@"狮鹫龙",@"神秘藏宝室",nil];
	[dict setObject:arr3 forKey:@"name"];
    [sectionData addObject:dict];
    
    */
    
    
    //创建一个tableView视图
	//创建UITableView 并指定代理
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	frame.origin.y = 0;
	tbView = [[UITableView alloc]initWithFrame:frame
                                         style:UITableViewStylePlain];
	[tbView setDelegate: self];
	[tbView setDataSource: self];
	[self.view addSubview: tbView];
}

//对指定的节进行“展开/折叠”操作
-(void)collapseOrExpand:(int)section{
	Boolean expanded = NO;
    
	//Boolean searched = NO;
	NSMutableDictionary* dictionary=[sectionData objectAtIndex:section];
	
	//若本节model中的“expanded”属性不为空，则取出来
	if([dictionary objectForKey:@"expanded"]!=nil)
		expanded=[[dictionary objectForKey:@"expanded"]intValue];
	
	//若原来是折叠的则展开，若原来是展开的则折叠
	[dictionary setObject:[NSNumber numberWithBool:!expanded] forKey:@"expanded"];
}

//返回指定节的“expanded”值
-(Boolean)isExpanded:(int)section{
	Boolean expanded = NO;
	NSMutableDictionary* dictionary=[sectionData objectAtIndex:section];
	
	//若本节model中的“expanded”属性不为空，则取出来
	if([dictionary objectForKey:@"expanded"]!=nil)
		expanded=[[dictionary objectForKey:@"expanded"]intValue];
    
	return expanded;
}

//按钮被点击时触发
-(void)expandButtonClicked:(id)sender{
	
	UIButton* btn= (UIButton*)sender;
	int section= btn.tag; //取得tag知道点击对应哪个块
	
	//	NSLog(@"click %d", section);
	[self collapseOrExpand:section];
	
	//刷新tableview
	[tbView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sectionData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	//对指定节进行“展开”判断
	if (![self isExpanded:section]) {
		//若本节是“折叠”的，其行数返回为0
		return 0;
	}
	
	NSDictionary* dictionary=[sectionData objectAtIndex:section];
    
	return [[dictionary objectForKey:@"name"] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	NSDictionary *dictionary= (NSDictionary*)[sectionData objectAtIndex: indexPath.section];
    
	NSArray *array = (NSArray*)[dictionary objectForKey:@"name"];
    
	if (array == nil) {
		return cell;
        NSLog(@"cell is nil");
	}
    
	cell.textLabel.text = [array objectAtIndex:indexPath.row];
	cell.textLabel.backgroundColor = [UIColor clearColor];
	cell.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_listbg.png"]];
    
    //图像
    WAR3NeutralHero *neuHero =[WAR3NeutralHero new];
    [neuHero deserializedArray];
    
    if (indexPath.section ==0 ) {
        NSMutableArray *imageArray = [[NSMutableArray alloc]initWithCapacity:[neuHero.deserializedArray count]];
        for (int i = 0 ; i< [neuHero.deserializedArray count]; i++) {
            NSDictionary *dictionary = neuHero.deserializedArray[i];
            NSString *imageName = [dictionary objectForKey:@"imageName"];
            [imageArray addObject:imageName];
        }
        UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
        cell.imageView.image = image;
    }
    
    /*
    if (indexPath.section ==1 ) {
        NSMutableArray *imageArray =[[NSMutableArray alloc]initWithCapacity:[humUnit.deserializedArray count]];
        for (int i = 0 ; i< [humUnit.deserializedArray count]; i++) {
            NSDictionary *dictionary = humUnit.deserializedArray[i];
            NSString *imageName = [dictionary objectForKey:@"imageName"];
            [imageArray addObject:imageName];
        }
        NSInteger row = [indexPath row];
        UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:row]];
        cell.imageView.image = image;
    }
    */
    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
	//选中行时灰色
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
	[cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

// 设置header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
	return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
	UIView *hView;
	if (UIInterfaceOrientationLandscapeRight == [[UIDevice currentDevice] orientation] ||
        UIInterfaceOrientationLandscapeLeft == [[UIDevice currentDevice] orientation])
	{
		hView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 480, 40)];
	}
	else
	{
		hView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
	}
    
	UIButton* eButton = [[UIButton alloc] init];
    
	//按钮填充整个视图
	eButton.frame = hView.frame;
	[eButton addTarget:self action:@selector(expandButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
	eButton.tag = section;//把节号保存到按钮tag，以便传递到expandButtonClicked方法
    
	//根据是否展开，切换按钮显示图片
	if ([self isExpanded:section])
		[eButton setImage: [ UIImage imageNamed: @"btn_down.png" ] forState:UIControlStateNormal];
	else
		[eButton setImage: [ UIImage imageNamed: @"btn_right.png" ] forState:UIControlStateNormal];
    
	//由于按钮的标题，
	//4个参数是上边界，左边界，下边界，右边界。
	eButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
	[eButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 10, 0, 0)];
	[eButton setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 0, 0)];
    
	//设置按钮显示颜色
	eButton.backgroundColor = [UIColor lightGrayColor];
	[eButton setTitle:[[sectionData objectAtIndex:section] objectForKey:@"groupname"] forState:UIControlStateNormal];
	[eButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[eButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	
	[eButton setBackgroundImage: [ UIImage imageNamed: @"btn_listbg.png" ] forState:UIControlStateNormal];//btn_line.png"
    
	[hView addSubview: eButton];
    
	return hView;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
