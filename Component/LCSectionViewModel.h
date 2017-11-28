//
//  LCSectionViewModel.h
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCReuseViewBaseViewModel.h"

@class LCRowViewModel;

@interface LCSectionViewModel : LCReuseViewBaseViewModel

@property (strong,nonatomic) NSMutableArray<LCRowViewModel*> *rows;

@property (strong,nonatomic) LCSectionViewModel *footerViewModel;

@end

@protocol ListComponentViewModelProtocol <NSObject>

@optional
- (void) setCellViewModel:(LCRowViewModel*) viewModel;
@optional
- (void) setSectionViewModel:(LCSectionViewModel*) viewModel;
@end
