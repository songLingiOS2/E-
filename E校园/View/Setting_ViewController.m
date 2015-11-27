//
//  Setting_ViewController.m
//  
//
//  Created by yd on 15/11/27.
//
//

#import "Setting_ViewController.h"
#import "Modify_ViewController.h"
#import "AboutMe_ViewController.h"
@interface Setting_ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Setting_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    [self createView];
}


-(void)createView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) , CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}
#pragma mark-----tableViewDateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }
    if (section == 2) {
        return 2;
    }
    if (section == 3) {
        return 1;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"firstVCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    NSArray *titleList = @[@"修改密码",@"联系客服MM",@"关于我们",@"退出登陆"];
    NSArray *imageList = @[@"secret",@"callme",@"aboutme",@"restart"];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        cell.showsReorderControl = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
    }
    
    //    cell.indentationLevel = indexPath.row;

    if (indexPath.section == 1 && indexPath.row ==  0) {
        cell.textLabel.text =titleList[0];
        cell.textLabel.textColor = [UIColor colorWithRed:0.137 green:0.890 blue:0.785 alpha:1.000];
        cell.imageView.image = [UIImage imageNamed:imageList[0]];
    }
    if (indexPath.section == 2 && indexPath.row ==  0) {
        cell.textLabel.text =titleList[1];
        cell.textLabel.textColor = [UIColor colorWithRed:0.137 green:0.890 blue:0.785 alpha:1.000];
        cell.imageView.image = [UIImage imageNamed:imageList[1]];
    }
    if (indexPath.section == 2 && indexPath.row ==  1) {
        cell.textLabel.text =titleList[2];
        cell.textLabel.textColor = [UIColor colorWithRed:0.137 green:0.890 blue:0.785 alpha:1.000];
        cell.imageView.image = [UIImage imageNamed:imageList[2]];
    }
    if (indexPath.section == 3 && indexPath.row ==  0) {
        cell.textLabel.text =titleList[3];
        cell.textLabel.textColor = [UIColor colorWithRed:0.137 green:0.890 blue:0.785 alpha:1.000];
        cell.imageView.image = [UIImage imageNamed:imageList[3]];
    }

    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld-----%ld",(long)indexPath.section,(long)indexPath.row);
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        Modify_ViewController *modify = [[Modify_ViewController alloc] init];
        [self.navigationController pushViewController:modify animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        AboutMe_ViewController *about = [[AboutMe_ViewController alloc] init];
        [self.navigationController pushViewController:about animated:YES];
    }
    if (indexPath.section == 3 && indexPath.row == 0) {
        
    }
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
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
