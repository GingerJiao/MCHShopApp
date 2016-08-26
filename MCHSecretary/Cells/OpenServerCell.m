//
//  OpenServerCell.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/26.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "OpenServerCell.h"

#import "WebImage.h"

#import "OpenServerFrame.h"
#import "AppPacketInfo.h"

#define GetFont(s) [UIFont systemFontOfSize:s]
#define NameFont GetFont(12)
#define ServerFont GetFont(10)
#define GetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LineColor GetColor(230,230,230,1.0)

@interface OpenServerCell()

@property (nonatomic, weak) UIView * leftView;
@property (nonatomic, weak) UIImageView * leftImageView;
@property (nonatomic, weak) UILabel * leftNameText;
@property (nonatomic, weak) UILabel * leftServerText;
@property (nonatomic, weak) UIButton * leftDiscountBtn;

@property (nonatomic, weak) UIView * rightView;
@property (nonatomic, weak) UIImageView * rightImageView;
@property (nonatomic, weak) UILabel * rightNameText;
@property (nonatomic, weak) UILabel * rightServerText;
@property (nonatomic, weak) UIButton * rightDiscountBtn;

@property (nonatomic, weak) UIView * lineview;

@end


@implementation OpenServerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype) cellWithTableView:(UITableView *)tableView{
    static NSString *identifer = @"commentstaopenservercellrlist";
    
    OpenServerCell *openservercell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if(openservercell == nil){
        openservercell = [[OpenServerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        openservercell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return openservercell;
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UIView *leftview = [[UIView alloc] init];
        [leftview setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:leftview];
        self.leftView = leftview;
        
        UIImageView *lefticon = [[UIImageView alloc] init];
        lefticon.layer.cornerRadius = 5;
        [self.contentView addSubview:lefticon];
        self.leftImageView = lefticon;
        
        UILabel *leftname = [[UILabel alloc] init];
        [leftname setTextColor:[UIColor blackColor]];
        [leftname setFont:NameFont];
        [leftname setNumberOfLines:1];
        [self.contentView addSubview:leftname];
        self.leftNameText = leftname;
        
        UILabel *leftserver = [[UILabel alloc] init];
        [leftserver setTextColor:[UIColor blackColor]];
        [leftserver setFont:ServerFont];
        [leftserver setNumberOfLines:1];
        [self.contentView addSubview:leftserver];
        self.leftNameText = leftserver;
        
        UIButton *leftdiscount = [[UIButton alloc] init];
        [leftdiscount setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        leftdiscount.titleLabel.font = ServerFont;
        [self.contentView addSubview:leftdiscount];
        self.leftDiscountBtn = leftdiscount;
        
        UIView *rightview = [[UIView alloc] init];
        [rightview setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:rightview];
        self.rightView = rightview;
        
        UIImageView *righticon = [[UIImageView alloc] init];
        righticon.layer.cornerRadius = 5;
        [self.contentView addSubview:righticon];
        self.rightImageView = righticon;
        
        UILabel *rightname = [[UILabel alloc] init];
        [rightname setTextColor:[UIColor blackColor]];
        [rightname setFont:NameFont];
        [rightname setNumberOfLines:1];
        [self.contentView addSubview:rightname];
        self.rightNameText = rightname;
        
        UILabel *rightserver = [[UILabel alloc] init];
        [rightserver setTextColor:[UIColor blackColor]];
        [rightserver setFont:ServerFont];
        [rightserver setNumberOfLines:1];
        [self.contentView addSubview:rightserver];
        self.rightNameText = rightserver;
        
        UIButton *rightdiscount = [[UIButton alloc] init];
        [rightdiscount setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        rightdiscount.titleLabel.font = ServerFont;
        [self.contentView addSubview:rightdiscount];
        self.rightDiscountBtn = rightdiscount;
        
        UIView *scrollLine = [[UIView alloc] init];
        [scrollLine setBackgroundColor:LineColor];
        [self addSubview:scrollLine];
        self.lineview = scrollLine;
    }
    return self;
}


-(void) setOpenServerFrame:(OpenServerFrame *)openServerFrame{
    _openServerFrame = openServerFrame;
    
    [self setSubViewFrame];
    [self setSubViewData];
    
}

-(void) setSubViewData{
    AppPacketInfo *leftApp = self.openServerFrame.leftApp;
    
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:leftApp.smallImageUrl] placeholderImage:nil];
    [self.leftNameText setText:leftApp.packetName];
    [self.leftServerText setText:@"新服"];
    [self.leftDiscountBtn setTitle:@"1.2" forState:UIControlStateNormal];
    
    AppPacketInfo *rightApp = self.openServerFrame.rightApp;
    if(rightApp != nil){
        [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:rightApp.smallImageUrl] placeholderImage:nil];
        [self.leftNameText setText:rightApp.packetName];
        [self.leftServerText setText:@"新服"];
        [self.leftDiscountBtn setTitle:@"1.2" forState:UIControlStateNormal];
    }
}

-(void) setSubViewFrame{
    
    self.leftView.frame = self.openServerFrame.leftViewFrame;
    self.leftImageView.frame = self.openServerFrame.leftImageFrame;
    self.leftNameText.frame = self.openServerFrame.leftNameFrame;
    self.leftServerText.frame = self.openServerFrame.leftServerFrame;
    self.leftDiscountBtn.frame = self.openServerFrame.leftDiscountFrame;
    
    self.rightView.frame = self.openServerFrame.rightViewFrame;
    self.rightImageView.frame = self.openServerFrame.rightImageFrame;
    self.rightNameText.frame = self.openServerFrame.rightNameFrame;
    self.rightServerText.frame = self.openServerFrame.rightServerFrame;
    self.rightDiscountBtn.frame = self.openServerFrame.rightDiscountFrame;
    
    self.lineview.frame = self.openServerFrame.lineFrame;
    
}

@end
