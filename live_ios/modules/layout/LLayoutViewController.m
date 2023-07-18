//
//  LayoutViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/11.
//

#import "LRouterTable.h"
#import "LLayoutViewController.h"
#import "LExampleListGroupItem.h"
#import "LExampleListGroup.h"

@interface LLayoutViewController ()<UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSIndexPath *_selectedIndexPath;
    NSArray *_exampleGroupList;
}

@end

@implementation LLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)initData {
    // UITableView group
    LExampleListGroupItem *contact = [LExampleListGroupItem initWithTitle:@"通讯录" andDetail:@"" andRouteName:@"native://contact"];
    LExampleListGroupItem *post = [LExampleListGroupItem initWithTitle:@"微博文章" andDetail:@"" andRouteName:@"native://post"];
    LExampleListGroup *uiTableViewGroup = [LExampleListGroup initWithName:@"UITableView" andChildren:[NSArray arrayWithObjects:contact, post, nil]];
    
    // UIImageViewGroup
    LExampleListGroupItem *uiImageView = [LExampleListGroupItem initWithTitle:@"UIImageView" andDetail:@"" andRouteName:@"native://uiImage"];
    LExampleListGroupItem *sdWebImage = [LExampleListGroupItem initWithTitle:@"SDWebImage" andDetail:@"SDWebImage 基本使用例子" andRouteName:@"native://sdWebImage"];
    LExampleListGroup *uiImage = [LExampleListGroup initWithName:@"UIImage" andChildren:[NSArray arrayWithObjects:uiImageView, sdWebImage, nil]];
    
    _exampleGroupList = [NSArray arrayWithObjects:uiTableViewGroup, uiImage, nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _exampleGroupList.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LExampleListGroup *group = _exampleGroupList[section];
    return group.children.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LExampleListGroup *group = _exampleGroupList[indexPath.section];
    LExampleListGroupItem *item = group.children[indexPath.row];
    
    static NSString *cellIdentifier = @"UITableViewCellIdentifier";
    UITableViewCell *cell;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.detail;
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    LExampleListGroup *group = _exampleGroupList[section];
    return group.name;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LExampleListGroup *group = _exampleGroupList[indexPath.section];
    LExampleListGroupItem *item = group.children[indexPath.row];
    NSString *viewControllerClazzName = [[LRouterTable sharedInstance] getViewControllerClazzNameByRouteName:item.routeName];
    Class viewControllerClass = NSClassFromString(viewControllerClazzName);
    UIViewController *vc = [[viewControllerClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
