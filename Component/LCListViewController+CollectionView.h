//
//  LCListViewController+CollectionView.h
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

#import "LCListViewController.h"

@protocol LCCollectionViewContorllerProtocol <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@end

@interface LCListViewController (CollectionView)<LCCollectionViewContorllerProtocol>

@end
