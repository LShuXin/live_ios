//
//  LPostViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import "LPostViewController.h"
#import "LStatus.h"
#import "LStatusTableViewCell.h"

@interface LPostViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells; // 存储cell， 用于计算高度
}

@end

@implementation LPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数据
    [self initData];
    
    // 创建一个分组样式的UITableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    // 设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource = self;
    
    // 设置代理
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark 加载数据
-(void)initData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StatusInfo" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _status = [[NSMutableArray alloc] init];
    _statusCells = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_status addObject:[LStatus statusWithDictionary:obj]];
        LStatusTableViewCell *cell = [[LStatusTableViewCell alloc] init];
        [_statusCells addObject:cell];
    }];
}


#pragma mark 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _status.count;
}

#pragma mark 返回每行的单元格
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%i %i", indexPath.section, indexPath.row);
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey";
    LStatusTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[LStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // 在此设置微博，以便重新布局
    LStatus *status = _status[indexPath.row];
    cell.status = status;
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LStatusTableViewCell *cell = _statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    return cell.height;
}
#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
