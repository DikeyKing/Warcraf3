//
//  WAR3HumanViewController.h
//  Warcraft 3:TFT
//
//  Created by Dikey on 3/30/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WAR3HumanViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
	UITableView *tbView;
	NSMutableArray *sectionData;
}

// @property (nonatomic, retain) IBOutlet WAR3HumanViewController *viewController;

@end
