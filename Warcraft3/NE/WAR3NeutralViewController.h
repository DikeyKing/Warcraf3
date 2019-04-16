//
//  WAR3NeutralViewController.h
//  Warcraft3
//
//  Created by Dikey on 5/5/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAR3NeutralViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
	UITableView *tbView;
	NSMutableArray *sectionData;
}
@end
