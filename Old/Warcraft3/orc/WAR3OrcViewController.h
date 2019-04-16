//
//  WAR3OrcViewController.h
//  Warcraft3
//
//  Created by Dikey on 4/8/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3OrcViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tbView;
    NSMutableArray *sectionData;
}

@end
