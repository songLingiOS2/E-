//
//  MyCenter_ViewController.m
//  
//
//  Created by yd on 15/11/26.
//
//

#import "MyCenter_ViewController.h"

@interface MyCenter_ViewController ()

@end

@implementation MyCenter_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(setting:)];
    
    
    [self createView];
}

-(void)createView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 80)];
    view.backgroundColor = [UIColor colorWithRed:0.074 green:0.804 blue:0.831 alpha:1.000];
    [self.view addSubview:view];
    
    
    
    UIImageView *imageVIew = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, CGRectGetWidth(view.frame)/6, CGRectGetWidth(view.frame)/6)];
    imageVIew.layer.masksToBounds = YES;
    imageVIew.layer.cornerRadius = (CGRectGetWidth(view.frame)/6)/2;
    imageVIew.image = [UIImage imageNamed:@"961"];
    [view addSubview:imageVIew];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetWidth(view.frame)/4, CGRectGetHeight(view.frame)/2, 80, 28);
    [button setTitle:@"点击登录" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:1.000 green:0.822 blue:0.609 alpha:1.000];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal] ;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    [button addTarget:self action:@selector(clickDenglu:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), CGRectGetWidth(view.frame), 28)];
    textField.text = @"我的课程";
    textField.backgroundColor = [UIColor colorWithWhite:0.942 alpha:1.000];
    [self.view addSubview:textField];
    
    
}

-(void)clickDenglu:(UIButton *)sender{
    NSLog(@".........................");
}

-(void)setting:(UIBarButtonItem *)sender{
    NSLog(@"xxxxxxxxxxx");
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
