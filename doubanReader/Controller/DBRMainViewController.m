//
//  DBRMainViewController.m
//  doubanReader
//
//  Created by wangshuang on 2017/5/16.
//  Copyright © 2017年 wangshuang. All rights reserved.
//

#import "DBRMainViewController.h"
#import "DBRCollectionView.h"
#import "DBRVerticalLayoutButton.h"

@interface DBRMainViewController ()<DBRCollectionViewDelegate>

/** <#des#> */
@property (nonatomic, strong) UIScrollView *scrollView;
/** <#des#> */
@property (nonatomic, strong) DBRCollectionView *readingView;
/** <#des#> */
@property (nonatomic, strong) DBRCollectionView *wishView;
/** <#des#> */
@property (nonatomic, strong) DBRCollectionView *readView;
/** <#des#> */
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation DBRMainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.readingView];
    [self reloadData];
}

- (void)reloadData {
    [self.manager GET:@"https://api.douban.com/v2/book/user/64390869/collections" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate
- (NSInteger)numberOfColumsInCollectionView:(DBRCollectionView *)collectionView {
    return 3;
}

- (NSInteger)totalNumberOfCollectionView:(DBRCollectionView *)collectionView {
    return 20;
}

- (DBRVerticalLayoutButton *)collectionView:(DBRCollectionView *)collectionView atIndex:(NSInteger)index {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    return (DBRVerticalLayoutButton *)button;
}

- (void)collectionView:(DBRCollectionView *)collectionView onItemClick:(NSInteger)index {
    NSLog(@"click %ld", index);
}

#pragma mark - lazy
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, CONTENT_HEIGHT)];
        _scrollView.backgroundColor = DBRRandomColor;
        _scrollView.contentSize = CGSizeMake(3 * SCREEN_WIDTH, CONTENT_HEIGHT);
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (DBRCollectionView *)readingView {
    if (!_readingView) {
        _readingView = [[DBRCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CONTENT_HEIGHT)];
        _readingView.backgroundColor = DBRRandomColor;
        _readingView.delegate = self;
    }
    return _readingView;
}

@end
