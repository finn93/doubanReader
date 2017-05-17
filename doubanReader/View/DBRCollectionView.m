//
//  DBRCollectionView.m
//  doubanReader
//
//  Created by wangshuang on 2017/5/16.
//  Copyright © 2017年 wangshuang. All rights reserved.
//

#import "DBRCollectionView.h"
#import "DBRVerticalLayoutButton.h"

#define kDBRCollectionViewId @"DBRCollectionViewId"

@interface DBRCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DBRCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)initUI {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    // 最小行间距
    layout.minimumLineSpacing = DBRMainMargin;
    // 最小列间距
    layout.minimumInteritemSpacing = DBRMainMargin;
    // item 列数
    int col = 3;
    // item尺寸
    CGFloat width = (SCREEN_WIDTH - ((col + 1) * DBRMainMargin)) / col;
    layout.itemSize = CGSizeMake(width, width * 1.5);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kDBRCollectionViewId];
    [self addSubview:_collectionView];
}

#pragma mark - UICollectionViewDataSource
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(DBRMainMargin, DBRMainMargin, DBRMainMargin, DBRMainMargin);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger sum = 0;
    if (_delegate && [_delegate respondsToSelector:@selector(totalNumberOfCollectionView:)]) {
        sum = [_delegate totalNumberOfCollectionView:self];
    }
    return sum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath   {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDBRCollectionViewId forIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(collectionView:atIndex:)]) {
        for (UIView *subView in cell.contentView.subviews) {
            if (subView.subviews) {
                [subView removeFromSuperview];
            }
        }
        DBRVerticalLayoutButton *view;
        view = [_delegate collectionView:self atIndex:indexPath.row];
        view.frame = CGRectMake(0, 0, cell.width, cell.height);
        view.backgroundColor = DBRRandomColor;
        view.tag = indexPath.row;
        [view addTarget:self action:@selector(onItemClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:view];
    }
    return cell;
}

#pragma mark - action
- (void)onItemClick:(DBRVerticalLayoutButton *)button{
    if (_delegate && [_delegate respondsToSelector:@selector(collectionView:onItemClick:)]) {
        [_delegate collectionView:self onItemClick:button.tag];
    }
}

#pragma mark - public
- (void)reLoadData {
//    NSInteger row = [self totalNumber] / [self numberOfColums] + (([self totalNumber] % [self numberOfColums]) > 0 ? 1: 0);
//    _collectionView.contentSize = CGSizeMake(SCREEN_WIDTH, self.height * row + (2 * DBRMainMargin));
    [_collectionView reloadData];
}

@end
