//
//  WAR3OrcArchitectViewController.m
//  Warcraft 3:TFT
//
//  Created by Dikey on 3/30/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3OrcArchitectViewController.h"
#import "WAR3OrcArchitect.h"

@interface WAR3OrcArchitectViewController ()

@end

@implementation WAR3OrcArchitectViewController

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
    WAR3OrcArchitect *orcArchitect =  [WAR3OrcArchitect new];
    [orcArchitect getDeserializedArray];
    
    _unitDic = orcArchitect.deserializedArray[_selectedRow];
    
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
