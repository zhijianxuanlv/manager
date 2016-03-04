//
//  CustomerCell.m
//  RealmDemo
//
//  Created by 罗成 on 16/1/4.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "CustomerCell.h"
@interface CustomerCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
- (IBAction)onClick:(id)sender;

@end
@implementation CustomerCell

- (void)setTalkModel:(TalkModel *)talkModel {
    _talkModel = talkModel;
//    self.avatorImageView.image = talkModel.image;
    self.titleLabel.text = talkModel.title;
    self.contentLabel.text = talkModel.comment;

}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contentLabel sizeThatFits:size].height;
//    totalHeight += [self.contentImageView sizeThatFits:size].height;
//    totalHeight += [self.usernameLabel sizeThatFits:size].height;
    totalHeight += 110; // margins
    return CGSizeMake(size.width, totalHeight);
}


- (IBAction)onClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(cellWithOnclick:)]) {
        [self.delegate cellWithOnclick:self];
    }
    
}
@end
