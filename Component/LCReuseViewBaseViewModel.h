//
//  LCReuseViewViewModel.h
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

@import UIKit;

typedef id(^CallBackBlock)();
#import <Foundation/Foundation.h>
@class LCReuseViewBaseViewModel;


@interface LCReuseViewBaseViewModel : NSObject

@property (strong, nonatomic) Class viewClass;
@property (copy, nonatomic) NSString *reuseId;

@property (assign, nonatomic) CGSize viewSize;


@property (copy, nonatomic) CallBackBlock callBack;

@end


