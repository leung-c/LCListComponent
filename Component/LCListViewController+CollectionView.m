//
//  LCListViewController+CollectionView.m
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//

#import "LCListViewController+CollectionView.h"
#import "LCRowViewModel.h"
#import "LCSectionViewModel.h"

@implementation LCListViewController (CollectionView)

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource ? self.dataSource.count : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LCSectionViewModel *model = [self.dataSource objectAtIndex:indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:model.reuseId forIndexPath:indexPath];

    return cell;

}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:indexPath.section];
    LCRowViewModel *rowVM = [sectionVM.rows objectAtIndex:indexPath.section];
    return rowVM.viewSize;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:indexPath.section];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionVM.reuseId forIndexPath:indexPath];        return view;
    }
    else{
         UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionVM.footerViewModel.reuseId forIndexPath:indexPath];
        return view;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:section];
    return sectionVM.viewSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:section];
    return sectionVM.footerViewModel.viewSize;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
