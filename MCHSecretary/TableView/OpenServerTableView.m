//
//  OpenServerTableView.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/26.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "OpenServerTableView.h"

#import "MJRefresh.h"

#import "OpenServerItem.h"

#import "OpenServerGameRequest.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define SelectDateH 35

#define GetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LineColor GetColor(230,230,230,1.0)

@implementation OpenServerTableView

@synthesize listItemArray;

-(instancetype) initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self initData];
        [self initView];
    }
    return self;
}

-(void) initData{
    listItemArray = [[NSMutableArray alloc] init];
}

-(void) initView{
    [self addSelectDateView];
    [self addTableView];
}

-(void) addSelectDateView{
    UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SelectDateH)];
    [selectView setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btnToday = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, SelectDateH)];
    [btnToday setTitle:NSLocalizedString(@"Today", @"") forState:UIControlStateNormal];
    [btnToday setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [selectView addSubview:btnToday];
    
    UIButton *btnTomorrow = [[UIButton alloc] initWithFrame:CGRectMake(110, 0, 100, SelectDateH)];
    [btnTomorrow setTitle:NSLocalizedString(@"Tomorrow", @"") forState:UIControlStateNormal];
    [btnTomorrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [selectView addSubview:btnTomorrow];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, SelectDateH - 1, kScreenWidth, 1)];
    [lineView setBackgroundColor:LineColor];
    
    [selectView addSubview:lineView];
    
    [self addSubview:selectView];
}

-(void) addTableView{
    
    openserverTable = [[UITableView alloc] initWithFrame:CGRectMake(0, SelectDateH, kScreenWidth, kScreenHeight - SelectDateH - 65)];
    openserverTable.delegate = self;
    openserverTable.dataSource = self;
    
    // 下拉刷新
    openserverTable.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self requestAppInfo];
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    openserverTable.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    openserverTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [openserverTable.mj_footer endRefreshing];
        });
    }];
    
    [self addSubview:openserverTable];
    
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return listItemArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    OpenServerItem *listitem = listItemArray[section];
//    //    NSLog(@"%ld, %ld", (long)section, (long)listitem.itemNumber);
//    if(listitem.cellType == CellStyle_Cycle){
//        return 1;
//    }
//    return listitem.appInfoArray.count;
    return listitem.appInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ChoiceListItem *listitem = listItemArray[indexPath.section];
//    if(listitem.cellType == CellStyle_Cycle){
//        CycleScrollCell *cycleCell = [CycleScrollCell cellWithTableView:tableView];
//        //        [cycleCell setScrollFrame:listitem.imageURLArray];
//        [cycleCell setScrollFrame:listitem.appInfoArray];
//        [cycleCell setScrollViewDelegate:self];
//        return cycleCell;
//    }else{
//        NomalCell *appcell = [NomalCell cellWithTableView:tableView];
//        NomalFrame *frame = listitem.appInfoArray[indexPath.row];
//        [appcell setNomalFrame:frame section:indexPath.section pos:indexPath.row];
//        appcell.delegate = self;
//        
//        return appcell;
//    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ChoiceListItem *listitem = listItemArray[indexPath.section];
//    if(listitem.cellType == CellStyle_Cycle){
//        return TopViewHeight;
//    }else{
//        NomalFrame *frame = listitem.appInfoArray[indexPath.row];
//        return frame.cellHeight;
//    }
    return 0;
}

-(CGFloat)tableView:(UITableView *) tableView heightForHeaderInSection:(NSInteger)section{
    //    return 0.01;
    //    ChoiceListItem *listitem = listItemArray[section];
    //    if(listitem.cellType == CellStyle_Nomal){
    //        return FloatingViewHeight;
    //    }else if (listitem.cellType == CellStyle_Other){
    //        return 20;
    //    } else {
    //        return 0.1;
    //    }
    
    return 0.1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


-(void)requestAppInfo{
    OpenServerGameRequest *gameRequest = [[OpenServerGameRequest alloc] init];
    [gameRequest requestOpenServerGame:^(NSMutableArray *opserverArray) {
        listItemArray = opserverArray;
        [openserverTable reloadData];
        [openserverTable.mj_header endRefreshing];
    } failure:^(NSURLResponse *response, NSError *error, NSDictionary *dic) {
        
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
