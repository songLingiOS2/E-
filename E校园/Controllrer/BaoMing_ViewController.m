//
//  BaoMing_ViewController.m
//  
//
//  Created by yd on 15/11/26.
//
//

#import "BaoMing_ViewController.h"

@interface BaoMing_ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BaoMing_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"培训课程";
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
    
    return 4;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
    cell.textLabel.text = @"这是第一个cell";
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld-----%ld",(long)indexPath.section,(long)indexPath.row);
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
