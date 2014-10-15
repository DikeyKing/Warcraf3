//
//  WAR3UDUnitSkillCell.h
//  Warcraft3
//
//  Created by Dikey on 4/15/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3UDUnitSkillCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *skillName;
@property (nonatomic, weak) IBOutlet UILabel *description;
@property (nonatomic, weak) IBOutlet UILabel *skillDetail;
@property (nonatomic, weak) IBOutlet UIImageView *skillImage;

@property (weak, nonatomic) UITableView *tableView;

@end
