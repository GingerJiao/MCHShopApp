//
//  OpenServerTableView.h
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/26.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenServerTableView : UIView<UITableViewDelegate, UITableViewDataSource>{
    UITableView *openserverTable;
    
}

@property (strong, nonatomic) NSMutableArray *listItemArray;

@end
