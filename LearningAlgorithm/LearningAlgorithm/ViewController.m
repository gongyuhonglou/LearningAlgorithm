//
//  ViewController.m
//  LearningAlgorithm
//
//  Created by mac on 2018/3/28.
//  Copyright © 2018年 WRP. All rights reserved.
//

#import "ViewController.h"
#import "RPAlgorithm.h"

// 定义该链表是为了存储不重复出现的单词
typedef struct _link
{
    // 数据
    char* data;
    // 下一个指针
    struct _link* next;
} Link;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"算法学习";
    
    _dataArray = @[@[@"冒泡排序",@"快速排序",@"插入排序",@"归并排序",@"堆排序,也叫选择排序"],@[@"希尔排序(暂无)",@"计算连续最大和的子数组",@"字符串 反转",@"去除字符串中重复字符",@"单链表反转"]];
    
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"tableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 1:
            {
                // 计算连续最大和的子数组
                NSArray* arr = @[@1, @2, @(-4), @4, @10, @(-3), @4, @(-5), @1];
                
                NSArray* maxArrM = [RPAlgorithm maxPlusWithArray:arr];
                
                NSLog(@"最大和子数组 %@", maxArrM);
            }
                break;
            case 2:
            {
                // 字符串 反转
                char s[] = "12345678903";
                [RPAlgorithm reverseForChar:s];
                
                NSLog(@"%s", s);
                
            }
                break;
            case 3:
            {
                // 去除字符串中重复字符
                char* input = "qweqwertyuutrerty";
                char output[17] = {"0"};
                
                [RPAlgorithm removeRepeadtChar:input output:output];
                
                NSLog(@"%s_%s", input, output);
                
            }
                break;
            case 4:
            {
                // 单链表反转
                // 头
                Link* head = (Link*)malloc(sizeof(Link));
                head->data = "A(head)";
                
                { // 创建其它的节点
                    head->next = (Link*)malloc(sizeof(Link));
                    head->next->data = "B";
                    
                    head->next->next = (Link*)malloc(sizeof(Link));
                    head->next->next->data = "C";
                    
                    head->next->next->next = (Link*)malloc(sizeof(Link));
                    head->next->next->next->data = "D";
                    
                    head->next->next->next->next = (Link*)malloc(sizeof(Link));
                    head->next->next->next->next->data = "E";
                }
                
                
                // 打印单链表
                [self printWithLink:head];
                
                [self reverseWithLink:head];
                
                [self printWithLink:head];
                
                
                
                
            }
                break;
                
            default:
                break;
        }
        
        return;
    }
    
    
    int array[5] = {34, 56, 12, 32, 21};
    // 排序前
    [RPAlgorithm printWithArray:array length:5];
    
    switch (indexPath.row) {
        case 0:
        {
            // 冒泡排序
            [RPAlgorithm bubbleSortWithArray:array length:5];
        }
            break;
        case 1:
        {
            // 快速排序
            [RPAlgorithm quickSortWithArray:array length:5];
            
        }
            break;
        case 2:
        {
            // 插入排序
            [RPAlgorithm insertSortWithArray:array length:5];
            
        }
            break;
        case 3:
        {
            // 归并排序
            [RPAlgorithm mergeSortWithArray:array length:5];
            
        }
            break;
        case 4:
        {
            // 堆排序,也叫选择排序
            [RPAlgorithm heapSortWithArray:array length:5];
            
        }
            break;
            
        default:
            break;
    }
    // 排序后
    [RPAlgorithm printWithArray:array length:5];
}

// 反转
- (void)reverseWithLink:(Link*)headeLink {
    Link *p, *q, *pr;
    p = headeLink->next;
    q = NULL;
    headeLink->next = NULL;
    
    while (p) {
        pr = p->next;
        p->next = q;
        q = p;
        p = pr;
    }
    
    headeLink->next = q;
}

// 打印
- (void)printWithLink:(Link*)headeLink {
    NSMutableArray* tmpArrM = [NSMutableArray array];
    // 遍历单列表
    Link* tmpLink = headeLink;
    
    while (tmpLink) {
        [tmpArrM addObject:[NSString stringWithFormat:@"%s", tmpLink->data]];
        tmpLink = tmpLink->next;
    }
    
    NSLog(@"链表打印: %@", [tmpArrM componentsJoinedByString:@"-->"]);
}

@end

