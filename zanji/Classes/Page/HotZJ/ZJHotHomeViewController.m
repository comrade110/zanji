//
//  ZJHotHomeViewController.m
//  zanji
//
//  Created by xiang-chen on 15/8/28.
//  Copyright (c) 2015年 chx. All rights reserved.
//

#import "ZJHotHomeViewController.h"
#import "BaseConfig.h"

@interface ZJHotHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZJHotHomeViewController{

    UITableView *m_tableView;
    NSArray *resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    m_tableView = [[UITableView alloc] init];
    m_tableView.backgroundColor = [UIColor clearColor];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [m_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ZJ"];
    [self.view addSubview:m_tableView];
    
    [m_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
    
    resultArray = @[
                    @[
                        @"3000-4000",
                        @"4000-5000",
                        @"5000-6000",
                        ],
                    @[
                        @"INTEL平台方案",
                        @"AMD平台方案",
                        @"兼容机型方案",
                        @"服务器方案",
                        ],
                    @[
                        @"游戏发烧型",
                        @"土豪型",
                        @"普通办公型",
                        @"学习型",
                        ],
                    ];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return resultArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [resultArray[section] count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"价格方案排行",@"热门程度排行",@"配置类型排行"][section];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZJ" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = resultArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
