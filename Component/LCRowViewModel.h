//
//  LCRowViewModel.h
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

#import "LCReuseViewBaseViewModel.h"

@interface LCRowViewModel : LCReuseViewBaseViewModel
@property (assign, nonatomic) CGFloat topSpacing;
@property (assign, nonatomic) CGFloat bottomSpacing;

@property (assign, nonatomic) BOOL showBottomLine;
@end
