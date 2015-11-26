//
//  Second_ViewController.m
//  
//
//  Created by yd on 15/11/26.
//
//

#import "Second_ViewController.h"

@interface Second_ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView1;
}
@end

@implementation Second_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    __unsafe_unretained UITableView *table = self.tableView;
    // 下拉刷新
    table.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView1.mj_header endRefreshing];
        });
    }];
    
    // 上拉刷新
    table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView1.mj_footer endRefreshing];
        });
    }];

    
    [self createView];
    
}

-(void)createView{
    tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) , CGRectGetHeight([UIScreen mainScreen].bounds)-100) style:UITableViewStylePlain];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    [self.view addSubview:tableView1];
    
}
#pragma mark-----tableViewDateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"firstVCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        cell.showsReorderControl = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //    cell.indentationLevel = indexPath.row;
    cell.textLabel.text = @"这是第二个cell";
    
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
