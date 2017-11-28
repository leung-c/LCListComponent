//
//  LCListViewController+TableView.h
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

#import "LCListViewController.h"

@protocol LCTableViewControllerProtocol <UITableViewDelegate,UITableViewDataSource>
@end

@interface LCListViewController (TableView)<LCTableViewControllerProtocol>

@end
