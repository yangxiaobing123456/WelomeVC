//
//  IWNewFeatureController.m
//  ItcastWeibo
//
//  Created by yz on 15/7/6.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import "IWNewFeatureController.h"
#import "IWNewFeatureCell.h"
#import <Availability.h>
#define IWNewFeatureCount 4

@interface IWNewFeatureController ()
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation IWNewFeatureController


- (instancetype)init
{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    
    // 添加padgeController
    [self setUpPadgeController];

}

- (void)setUpPadgeController
{
    
    UIPageControl *page = [[UIPageControl alloc] init];
    page.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height);
    page.numberOfPages = IWNewFeatureCount;
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl = page;
    [self.view addSubview:page];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    
    _pageControl.currentPage = page;
    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return IWNewFeatureCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    IWNewFeatureCell *cell = [IWNewFeatureCell cellWithCollectionView:collectionView indexPath:indexPath];
    
    // Configure the cell
    NSString *imageName = [NSString stringWithFormat:@"%ld-1-568h",indexPath.row + 1];
    

//    if (self.view.frame.size.height==568) {
//        imageName = [imageName stringByAppendingString:@"-568h"];
//    }


    cell.imageName = imageName;
    
    [cell setIndexPath:indexPath pagecount:IWNewFeatureCount];
    
    return cell;
}



@end
