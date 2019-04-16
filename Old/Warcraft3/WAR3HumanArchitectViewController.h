//
//  WAR3HumanArchitectViewController.h
//  Warcraft 3:TFT
//
//  Created by Dikey on 3/30/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3HumanArchitectViewController : UIViewController




@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, strong) NSMutableDictionary *unitDic;

@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;


@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView2;


 
@end
