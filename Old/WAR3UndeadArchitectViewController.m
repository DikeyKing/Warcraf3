//
//  WAR3UndeadArchitectViewController.m
//  Warcraft 3:TFT
//
//  Created by Dikey on 3/30/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3UndeadArchitectViewController.h"
#import "WAR3UndeadArchitect.h"

@interface WAR3UndeadArchitectViewController ()

@end

@implementation WAR3UndeadArchitectViewController

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
    WAR3UndeadArchitect *udArchitect =  [WAR3UndeadArchitect new];
    [udArchitect getDeserializedArray];
    _unitDic = udArchitect.deserializedArray[_selectedRow];
    
     UIImage *image = [UIImage imageNamed:[_unitDic objectForKey:@"imageName3"]];
    _imageView.image = image ;
     
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
