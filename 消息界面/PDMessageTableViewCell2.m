//
//  PDMessageTableViewCell2.m
//  消息界面
//
//  Created by David on 16/6/14.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "PDMessageTableViewCell2.h"
#import "PDMessageModel.h"
#import "UIView+SDAutoLayout.h"
#define MessageBigMargin 5
#define MessageSmallMargin 3

@interface PDMessageTableViewCell2 ()

@property (nonatomic, strong) UIImageView * backImageView;
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UIImageView * cuttinglineImageView;
@property (nonatomic, strong) UILabel * limitSeeLabel;
@end


@implementation PDMessageTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUP];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUP
{
    // 添加控件
    self.backImageView = [[UIImageView alloc] init];
    self.backImageView.image = [UIImage imageNamed:@"消息框1"];
    [self.contentView addSubview:self.backImageView];
    
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:13];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    self.contentImageView = [[UIImageView alloc] init];
    self.contentImageView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:self.contentImageView];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contentLabel.font = [UIFont systemFontOfSize:13];
    self.contentLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.contentLabel];
    
    self.cuttinglineImageView = [[UIImageView alloc] init];
    self.cuttinglineImageView.image = [UIImage imageNamed:@"line"];
    [self.contentView addSubview:self.cuttinglineImageView];
    
    self.limitSeeLabel = [[UILabel alloc] init];
    self.limitSeeLabel.font = [UIFont systemFontOfSize:13];
    self.limitSeeLabel.textColor = [UIColor lightGrayColor];
    self.limitSeeLabel.text = @"立即查看";
    [self.contentView addSubview:self.limitSeeLabel];
    
    // 设置frame
    UIView *contentView = self.contentView;
    
    self.backImageView.sd_layout
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .topEqualToView(contentView)
    .bottomEqualToView(contentView);
    
    self.iconImageView.sd_layout
    .leftSpaceToView(contentView, MessageBigMargin)
    .topSpaceToView(contentView, MessageBigMargin)
    .widthIs(30)
    .heightIs(30);
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.iconImageView, 3)
    .centerYEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(20);
    
    self.timeLabel.sd_layout
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(20)
    .topSpaceToView(self.iconImageView, 3);
    
    self.contentImageView.sd_layout
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(140)
    .topSpaceToView(self.timeLabel, MessageSmallMargin);
    
    self.contentLabel.sd_layout
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .topSpaceToView(self.contentImageView, 3)
    .autoHeightRatio(0);
    
    self.cuttinglineImageView.sd_layout
    .topSpaceToView(self.contentLabel, MessageSmallMargin)
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(1);
    
    self.limitSeeLabel.sd_layout
    .topSpaceToView(self.cuttinglineImageView,MessageSmallMargin)
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(20);
    
    [self setupAutoHeightWithBottomView:self.limitSeeLabel bottomMargin:MessageBigMargin];
}

- (void)setModel:(PDMessageModel *)model
{
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:@"系统消息"];
    self.contentImageView.image = [UIImage imageNamed:@"banner"];
    self.timeLabel.text = model.time;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 10;
    frame.size.width -= 2 * 10;
    frame.size.height -= 10;
    frame.origin.y += 10;
    [super setFrame:frame];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
