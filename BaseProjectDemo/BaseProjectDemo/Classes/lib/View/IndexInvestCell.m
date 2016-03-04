//
//  IndexInvestCell.m
//  Bel
//
//  Created by Leon on 16/1/28.
//  Copyright © 2016年 上海指旺信息科技有限公司. All rights reserved.
//

#import "IndexInvestCell.h"
#import "ZFProgressView.h"

@interface IndexInvestCell ()

@property (nonatomic, weak) IBOutlet UIButton *titleBtn;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodsLabel;
@property (nonatomic, weak) IBOutlet UIView *progressView;

@property (nonatomic, weak) ZFProgressView *zfProgressView;

@end


@implementation IndexInvestCell

//- (instancetype) initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        DebugLog(@"==> %@", self.progressView);
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        DebugLog(@"==> %@", self.progressView);
//    }
//    return self;
//}

- (ZFProgressView *)zfProgressView {
    if(_zfProgressView == nil) {
        ZFProgressView *zfProgressView = [[ZFProgressView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        zfProgressView.backgourndLineWidth = 3;
        zfProgressView.progressLineWidth = 3;
        zfProgressView.backgroundStrokeColor = [UIColor colorWithHexString:@"#dedede"];
        zfProgressView.progressStrokeColor = [UIColor colorWithHexString:@"#fe6658"];
        zfProgressView.digitTintColor = [UIColor colorWithHexString:@"#fe6658"];
        //        zfProgressView.timeDuration = 0.5;
        _zfProgressView = zfProgressView;
        [self.progressView addSubview:zfProgressView];
    }
    return _zfProgressView;
}

- (void)setBaseModel:(InvestModel *)baseModel {
    _baseModel = baseModel;
    
    _rateLabel.attributedText =
        [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%.1f",_baseModel.rate ] fontSize:21  unitString:@"%"];
    _periodsLabel.attributedText =
        [LCAttributeString boldStringWith:[NSString stringWithFormat:@"%ld",_baseModel.periods ] fontSize:21 unitString:@"个月"];
//    _periodsLabel.attributedText =
//    [LSAttributeString boldStringWith:[NSString stringWithFormat:@"%ld",_baseModel.periods ] unit:@"天"];
//    self.zfProgressView.frame = self.progressView.bounds;
    [self.zfProgressView setProgress:_baseModel.progress / 100.0  Animated:NO];
}



@end
