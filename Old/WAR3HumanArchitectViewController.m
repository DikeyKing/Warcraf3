//
//  WAR3HumanArchitectViewController.m
//  Warcraft 3:TFT
//
//  Created by Dikey on 3/30/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3HumanArchitectViewController.h"
#import "WAR3HumanArchitect.h"

@interface WAR3HumanArchitectViewController ()

@end

@implementation WAR3HumanArchitectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    
    _scrollView.frame = CGRectMake(0, 0, 320, 550);

    _scrollView.ContentSize = CGSizeMake(320, 600);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WAR3HumanArchitect *humArchitect =  [WAR3HumanArchitect new];
    [humArchitect getDeserializedArray];
    _unitDic = humArchitect.deserializedArray[_selectedRow];
    
     UIImage *image = [UIImage imageNamed:[_unitDic objectForKey:@"imageName3"]];
    _imageView.image = image ;
  
    
    /* 图片2在此加入
    image = [ UIImage imageNamed:[_unitDic objectForKey:@"imageName4"]];
    _imageView2.image = image ;
    */
    
    
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
