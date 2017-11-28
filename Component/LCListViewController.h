//
//  LCListViewController.h
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

@import UIKit;

@class LCSectionViewModel;
@interface LCListViewController : UIViewController

@property (strong,nonatomic) NSMutableArray<LCSectionViewModel*> *dataSource;

@property (strong,nonatomic,readonly) UITableView* tableView;

@property (strong,nonatomic,readonly) UICollectionView *collectionView;

@end
