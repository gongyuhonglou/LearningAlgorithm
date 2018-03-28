//
//  RPAlgorithm.h
//  LearningAlgorithm
//
//  Created by mac on 2018/3/28.
//  Copyright © 2018年 WRP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPAlgorithm : NSObject

// 冒泡排序
+ (void)bubbleSortWithArray:(int*)array length:(int)length;

// 快速排序 算法复杂度：不稳定，期望时间 O(nlog n) ，最坏情况 O(n^2)； 对于大的、乱数列表一般相信是最快的已知排序。
+ (void)quickSortWithArray:(int*)array length:(int)length;

// 插入排序
+ (void)insertSortWithArray:(int*)array length:(int)length;

// 归并排序
+ (void)mergeSortWithArray:(int*)array length:(int)length;

// 堆排序,也叫选择排序
+ (void)heapSortWithArray:(int*)array length:(int)length;


// 打印
+ (void)printWithArray:(int*)array length:(int)length;


// 字符串反转
+ (void)reverseForChar:(char*)ch;

// 去除字符串中重复字符
+ (void)removeRepeadtChar:(char*)input output:(char*)output;

// 计算连续最大和的子数组
+ (NSArray*)maxPlusWithArray:(NSArray*)oArr;

@end

