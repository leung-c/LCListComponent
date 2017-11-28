//
//  LCListViewController+TableView.m
//  LCgo
//
//  Created by liangchao on 17/11/16.
//  Copyright © 2017年 LCgo. All rights reserved.
//
@import UIKit;
#import "LCListViewController+TableView.h"
#import "LCSectionViewModel.h"
#import "LCRowViewModel.h"

@implementation LCListViewController (TableView)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

#pragma mark - header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LCSectionViewModel* sectionVM = [self.dataSource objectAtIndex:section];
    if(!sectionVM) return nil;
    
    UITableViewHeaderFooterView<ListComponentViewModelProtocol> *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionVM.reuseId];
    if (!headerView) {
        Class headerViewClass = sectionVM.viewClass ?: NSClassFromString(sectionVM.reuseId);
        [self raiseException:headerViewClass];
        headerView = [[headerViewClass alloc] initWithReuseIdentifier:sectionVM.reuseId];
    }
    if([headerView respondsToSelector:@selector(setSectionViewModel:)]){
        [headerView setSectionViewModel:sectionVM];
    }

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:section];
    return sectionVM.viewSize.height;
}

#pragma mark - cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:section];
    return  sectionVM.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:indexPath.section];
    LCRowViewModel *rowViewModel = [sectionVM.rows objectAtIndex:indexPath.row];
    
    UITableViewCell<ListComponentViewModelProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:rowViewModel.reuseId];
    if (!cell) {
        Class cellClass = rowViewModel.viewClass?: NSClassFromString(rowViewModel.reuseId);
        [self raiseException:cellClass];
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rowViewModel.reuseId];
    }
    if([cell respondsToSelector:@selector(setCellViewModel:)]){
        [cell setCellViewModel:rowViewModel];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:indexPath.section];
    LCRowViewModel *rowViewModel = [sectionVM.rows objectAtIndex:indexPath.row];
    return rowViewModel.viewSize.height ?: tableView.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LCSectionViewModel *sectionVM = [self.dataSource objectAtIndex:indexPath.section];
    LCRowViewModel *rowViewModel = [sectionVM.rows objectAtIndex:indexPath.row];
    if (rowViewModel.callBack) {
        rowViewModel.callBack();
    }
}

#pragma mark - footer
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    LCSectionViewModel* sectionVM = [self.dataSource objectAtIndex:section];
    if(!sectionVM) return nil;
    LCSectionViewModel *footerLayout = sectionVM.footerViewModel;
    UITableViewHeaderFooterView<ListComponentViewModelProtocol> *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerLayout.reuseId];
    if (!footerView) {
        Class headerViewClass = footerLayout.viewClass ?: NSClassFromString(footerLayout.reuseId);
        [self raiseException:headerViewClass];
        footerView = [[headerViewClass alloc] initWithReuseIdentifier:footerLayout.reuseId];
    }
    if([footerView respondsToSelector:@selector(setSectionViewModel:)]){
        [footerView setSectionViewModel:sectionVM.footerViewModel];
    }
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    LCSectionViewModel* sectionVM = [self.dataSource objectAtIndex:section];
    return sectionVM.footerViewModel.viewSize.height;
}

- (void)raiseException:(Class)c {
    if (c) return;
    [NSException raise:@"class not found" format:@"对象需设置viewClass，或者reuseId对应类名"];
}


@end
