//
//  Login_ViewController.m
//  
//
//  Created by yd on 15/11/27.
//
//

#import "Login_ViewController.h"
#import "Register_ViewController.h"
#import "AFNetworking.h"

@interface Login_ViewController ()<UITextFieldDelegate>
{
    UITextField *userName;
    UITextField *userPsw;
    AFHTTPRequestOperationManager *manager;
}


@end

@implementation Login_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(Register:)];
    
    manager = [AFHTTPRequestOperationManager manager];
    
    
    [self createView];
    
}
-(void)createView{
   
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/3, CGRectGetHeight([UIScreen mainScreen].bounds)/8, CGRectGetWidth([UIScreen mainScreen].bounds)/3, CGRectGetWidth([UIScreen mainScreen].bounds)/3)];
    imageView.image = [UIImage imageNamed:@"961"];
    [self.view addSubview:imageView];
    
    
    
    userName = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/6, CGRectGetMaxY(imageView.frame)+10, CGRectGetWidth([UIScreen mainScreen].bounds)*2/3 , 44)];
    userName.placeholder  = @"请输入账号";
    userName.borderStyle  = UITextBorderStyleRoundedRect;
    userName.backgroundColor  = [UIColor whiteColor];
    userName.textColor = [UIColor blackColor];
    userName.delegate = self;
    [self.view addSubview:userName];
    
    userPsw = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/6, CGRectGetMaxY(userName.frame)+5, CGRectGetWidth([UIScreen mainScreen].bounds)*2/3 , 44)];
    userPsw.placeholder  = @"请输入密码";
    userPsw.backgroundColor  = [UIColor whiteColor];
    userPsw.textColor = [UIColor blackColor];
    userPsw.borderStyle = UITextBorderStyleRoundedRect;
    userPsw.delegate = self;
    userPsw.secureTextEntry = YES;
    [self.view addSubview:userPsw];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame  = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/3, CGRectGetMaxY(userPsw.frame)+10, CGRectGetWidth([UIScreen mainScreen].bounds)/3, 44);
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0.308 green:0.820 blue:0.754 alpha:1.000];
    [btn addTarget:self action:@selector(LoginBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10;
    [self.view addSubview:btn];
    
    
}


-(void)LoginBtn{
    NSLog(@"...%@..........%@.....",userName.text,userPsw.text);
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *dict = @{ @"format":@"normal",@"pwd":userPsw.text, @"username":userName.text };
    
    if (userName.text.length == 11) {
        
        if (userPsw.text.length >= 6) {
            
            [manager GET:@"http://m.yaode100.com:88/Esch/user/userlogin?" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSLog(@"ooooo%@",responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"xxxx%@",error);
            }];
            
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"密码小于六位,请重新输入" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"请输入正确的手机号" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
    
    
    
    
    
    
}

-(void)Register:(UITabBarItem *)sender{
    Register_ViewController *Register = [[Register_ViewController alloc] init];
    [self.navigationController pushViewController:Register animated:YES];
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
