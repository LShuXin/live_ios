//
//  LContactViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/11.
//

#import "LContactViewController.h"
#import "LContact.h"
#include "LContactGroup.h"

@interface LContactViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_contacts; // 联系人模型
    NSIndexPath *_selectedIndexPath; // 当前选中的组和行
}

@end

@implementation LContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化数据
    [self initData];
    
    // 创建一个分组样式的UITableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    // 设置数据源
    _tableView.dataSource = self;
    
    // 设置代理
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark 加载数据
-(void)initData{
    _contacts = [[NSMutableArray alloc] init];
    
    LContact *contact1 = [LContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    LContact *contact2 = [LContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    LContactGroup *group1 = [LContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects: contact1, contact2, nil]];
    [_contacts addObject:group1];
    

    LContact *contact3 = [LContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    LContact *contact4 = [LContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    LContact *contact5 = [LContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    LContactGroup *group2 = [LContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects: contact3, contact4, contact5, nil]];
    [_contacts addObject:group2];
    
    LContact *contact6 = [LContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    LContact *contact7 = [LContact initWithFirstName:@"Sun" andLastName:@"Rose" andPhoneNumber:@"18500131236"];
    LContactGroup *group3 = [LContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects: contact6, contact7, nil]];
    [_contacts addObject:group3];
    
    LContact *contact8 = [LContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    LContact *contact9 = [LContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    LContact *contact10 = [LContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    LContact *contact11 = [LContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131243"];
    LContact *contact12 = [LContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    LContactGroup *group4 = [LContactGroup initWithName:@"W" andDetail:@"With names beginning with A" andContacts:[NSMutableArray arrayWithObjects: contact8, contact9, contact10, contact11, contact12, nil]];
    [_contacts addObject:group4];
    
    LContact *contact13 = [LContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    LContact *contact14 = [LContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    LContact *contact15 = [LContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    LContactGroup *group5 = [LContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13, contact14, contact15, nil]];
    [_contacts addObject:group5];
    
}


#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"计算分组数");
    return _contacts.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"计算每组（组%i）行数", section);
    LContactGroup *lContactGroup = _contacts[section];
    return lContactGroup.contacts.count;
    
}

#pragma mark 返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // NSIndexPath 是一个对象，记录了组和行信息
    NSLog(@"生成单元格（组：%i, 行： %i）", indexPath.section, indexPath.row);
    LContactGroup *group = _contacts[indexPath.section];
    LContact *contact = group.contacts[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"生成组（组%i）名称", section);
    LContactGroup *group = _contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSLog(@"生成尾部（组%i）详情");
    LContactGroup *group = _contacts[section];
    return group.detail;
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
