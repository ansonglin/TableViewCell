//
//  ViewController.m
//  TableView
//
//  Created by mac on 16/3/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "CustomBut.h"


#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *butArr;
@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTabbleView];
    self.butArr = [NSMutableArray array];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)creatTabbleView
{
#pragma UITableViewStyleGrouped可以让每个分组的headerview随着滚动
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSString *rowStr = [NSString stringWithFormat:@"%ld", indexPath.row];
    if ([self.butArr containsObject:rowStr]) {
        [cell.likeBut setBackgroundColor:[UIColor redColor]];
    } else {
        [cell.likeBut setBackgroundColor:[UIColor orangeColor]];
    }
    cell.likeBut.rows = indexPath.row;
    [cell.likeBut addTarget:self action:@selector(likeButAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


- (void)likeButAction:(CustomBut *)but
{
    NSString *str = [NSString stringWithFormat:@"%ld", but.rows];
    if ([self.butArr containsObject:str]) {
        [self.butArr removeObject:str];
         [but setBackgroundColor:[UIColor orangeColor]];
    } else {
         [self.butArr addObject:str];
        [but setBackgroundColor:[UIColor redColor]];
    }
    
    NSLog(@"111%@", self.butArr);
    
    NSLog(@"对第%ld个cell点赞", but.rows);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
