//
//  DBRCollectionView.h
//  doubanReader
//
//  Created by wangshuang on 2017/5/16.
//  Copyright © 2017年 wangshuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBRCollectionView;
@class DBRVerticalLayoutButton;

@protocol DBRCollectionViewDelegate <NSObject>

@required
// collectionView中item总数量
- (NSInteger)totalNumberOfCollectionView:(DBRCollectionView *)collectionView;
// 返回每个item
- (DBRVerticalLayoutButton *)collectionView:(DBRCollectionView *)collectionView atIndex:(NSInteger)index;

@optional
// 列的数量
- (NSInteger)numberOfColumsInCollectionView:(DBRCollectionView *)collectionView;
// 每行的高度
- (CGFloat)heightForRowInCollectionView:(DBRCollectionView *)collectionView;
// item点击事件
- (void)collectionView:(DBRCollectionView *)collectionView onItemClick:(NSInteger)index;

@end

@interface DBRCollectionView : UIView

@property (nonatomic, weak) id<DBRCollectionViewDelegate> delegate;

- (void)reLoadData;

@end
