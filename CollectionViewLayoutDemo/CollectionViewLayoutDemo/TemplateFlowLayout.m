//
//  TemplateFlowLayout.m
//  CollectionViewLayoutDemo
//
//  Created by 罗成 on 15/12/31.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "TemplateFlowLayout.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.4
#define DecoTemplateSectionTopInset 150
#define DecoTemplateItemCellMinumPadding 8

@interface TemplateFlowLayout ()

@property (nonatomic, assign) CGFloat previousOffset;
@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation TemplateFlowLayout


//layout前期设置参数
- (void)prepareLayout {
    
    [super prepareLayout];
    //layout itemSize height
    CGFloat sectionEdgeTop = CGRectGetHeight(self.collectionView.frame) - DecoTemplateSectionTopInset*2;
    
    
    
//    设定全局的Cell尺寸
    self.itemSize = CGSizeMake(SCREEN_WIDTH - 36, sectionEdgeTop);
    
    NSLog(@"itemSize = %@",NSStringFromCGSize(self.itemSize));
    
//    设定全局的Cell间距
    self.minimumInteritemSpacing = DecoTemplateItemCellMinumPadding;
    
//    设定全局的区内边距
    self.sectionInset = UIEdgeInsetsMake(DecoTemplateSectionTopInset, DecoTemplateItemCellMinumPadding+10, DecoTemplateSectionTopInset, DecoTemplateItemCellMinumPadding+10);
    
    //设置水平滚动或垂直滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    
    
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{

    NSLog(@"proposedContentOffset.x = %f",proposedContentOffset.x);
    // 判断是否为第一个
    if (proposedContentOffset.x<SCREEN_WIDTH/2) {
        return CGPointZero;
    }
    // 判断是否为最后一个
    if (proposedContentOffset.x>self.collectionViewContentSize.width-SCREEN_WIDTH*1.5+self.sectionInset.right) {
        return CGPointMake(self.collectionViewContentSize.width-SCREEN_WIDTH, 0);
    }
    CGSize collectionViewSize = self.collectionView.bounds.size;
    CGFloat proposedContentOffsetCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5f;

    CGRect proposedRect = self.collectionView.bounds;

    // 中心停留在cell的center
    // proposedRect = CGRectMake(proposedContentOffset.x, 0.0, collectionViewSize.width, collectionViewSize.height);

    UICollectionViewLayoutAttributes* candidateAttributes;
    for (UICollectionViewLayoutAttributes* attributes in [self layoutAttributesForElementsInRect:proposedRect])
    {

        // 碰到header和footer跳过//
        if (attributes.representedElementCategory != UICollectionElementCategoryCell)
        {
            continue;
        }

        // 判断是否第一次 //
        if(!candidateAttributes)
        {
            candidateAttributes = attributes;
            continue;
        }

        if (fabsf(attributes.center.x - proposedContentOffsetCenterX) < fabsf(candidateAttributes.center.x - proposedContentOffsetCenterX))
        {
            candidateAttributes = attributes;
        }
    }


     return CGPointMake(candidateAttributes.center.x - self.collectionView.bounds.size.width * 0.5f, proposedContentOffset.y);

}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                if (zoom>1.05) {
                    zoom=1.05;
                }
                attributes.transform3D = CATransform3DMakeScale(1, zoom, 1.0);
                attributes.zIndex = 1;
                
            }
        }
    }
    return array;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {

    return YES;

}


@end
