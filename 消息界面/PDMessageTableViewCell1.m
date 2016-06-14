//
//  PDMessageTableViewCell1.m
//  消息界面
//
//  Created by David on 16/6/14.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "PDMessageTableViewCell1.h"
#import "UIView+SDAutoLayout.h"
#import "PDMessageModel.h"
#define MessageBigMargin 5
#define MessageSmallMargin 3

@interface PDMessageTableViewCell1 ()

@property (nonatomic, strong) UIImageView * backImageView;
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UILabel * contentLabel;

@end


@implementation PDMessageTableViewCell1


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
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contentLabel.font = [UIFont systemFontOfSize:13];
    self.contentLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.contentLabel];
    
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
    .leftSpaceToView(self.iconImageView, MessageSmallMargin)
    .centerYEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(20);
    
    self.timeLabel.sd_layout
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .heightIs(20)
    .topSpaceToView(self.iconImageView, MessageSmallMargin);
    
    self.contentLabel.sd_layout
    .leftEqualToView(self.iconImageView)
    .rightSpaceToView(contentView, MessageBigMargin)
    .topSpaceToView(self.timeLabel, MessageSmallMargin)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:MessageBigMargin];
}

- (void)setModel:(PDMessageModel *)model
{
    _model = model;
    self.backImageView.image = [UIImage imageNamed:@"消息框1"];
    self.iconImageView.image = [UIImage imageNamed:@"系统消息"];
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
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
