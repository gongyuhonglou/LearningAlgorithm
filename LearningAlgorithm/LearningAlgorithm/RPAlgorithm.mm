//
//  RPAlgorithm.m
//  LearningAlgorithm
//
//  Created by mac on 2018/3/28.
//  Copyright © 2018年 WRP. All rights reserved.
//

#import "RPAlgorithm.h"

@implementation RPAlgorithm

// 冒泡排序
+ (void)bubbleSortWithArray:(int*)array length:(int)length {
    int i, j/**, k*/;
    for (i=0; i<(length-1); i++) {
        for (j=0; j<(length-1-i); j++) {
            if (array[j]>array[j+1]) {
                {
                    /** 方式一: 使用中间变量
                     k = array[j];
                     array[j] = array[j+1];
                     array[j+1] = k;
                     */
                }
                
                {
                    /** 方式二: 只用亦或
                     array[j] ^= array[j+1];
                     array[j+1] ^= array[j];
                     array[j] ^= array[j+1];
                     */
                }
                
                {
                    // 方式三: 使用加减
                    array[j] += array[j+1];
                    array[j+1] = array[j]-array[j+1];
                    array[j] -= array[j+1];
                }
                
            }
        }
    }
}

// 快速排序
void quick_sort(int a[], int l, int r) {
    if (l>=r){
        return;
    }
    
    int i = l, j = r, x = a[l];
    while (i < j) {
        // 从右到左, 找出比x小的数的下标
        while ((i < j) && (a[j] >= x)) {
            j--;
        }
        
        if (i < j) {
            a[i++] = a[j];
        }
        
        
        // 从左到右, 找出比x大的数的小标
        while ((i < j) && (a[i] < x)) {
            i++;
        }
        
        if (i < j) {
            a[j--] = a[i];
        }
    }
    
    a[i] = x;
    
    quick_sort(a, l, i-1);
    quick_sort(a, i+1, r);
    
}

+ (void)quickSortWithArray:(int*)array length:(int)length {
    quick_sort(array, 0, length-1);
}

void insertSort(int a[], int length) {
    int i, j, key;
    for (j = 1; j<length; j++) {
        key = a[j];
        i = j - 1;
        while ((i>=0) && (a[i] > key)) {
            a[i+1] = a[i];
            i--;
        }
        a[i+1] = key;
    }
}


// 插入排序
+ (void)insertSortWithArray:(int*)array length:(int)length {
    insertSort(array, length);
}

// 归并排序 p, q, r均为数组下标
void merge(int *A, int p, int q, int r, int length)
{
    printf("p=%d q=%d r=%d ", p, q, r);
    
    int i, j, k;
    int n1 = q - p + 1;
    int n2 = r - q;
    
    int L[length], R[length];
    
    for (i = 0; i < n1; i++)
        L[i] = A[p + i];
    for (j = 0; j < n2; j++)
        R[j] = A[q + j + 1];
    
    /*
     * 哨兵牌
     *L[n1] = 99999;
     *R[n2] = 99999;
     */
    
    i = 0;
    j = 0;
    
    for (k = p; k <= r; k++)
    {
        //如果其中一侧的元素复制完了，那么剩下的另一侧元素无需比较，直接复制即可
        //这样做是必须的，因为一侧元素复制完后，它的指针指向的元素就是一个未知数（访问越界）
        //另一种方法是使用哨兵牌，在每一侧末尾放置一个无限大的数。
        if (i >= n1)
        {
            A[k] = R[j++];
            continue;
        }
        else if (j >= n2)
        {
            A[k] = L[i++];
            continue;
        }
        
        if (L[i] <= R[j])
        {
            A[k] = L[i];
            i++;
        }
        else
        {
            A[k] = R[j];
            j++;
        }
    }
    
    //    prtarry(A, r+1);
    [RPAlgorithm printWithArray:A length:r+1];
}

void merge_sort(int *A, int p, int r, int length)
{
    int q;
    if (p < r)
    {
        //q = (p + r) / 2;              // p + r有可能会溢出
        //q = p/2 + r/2;                // 两次除法会导致精度成倍降低，导致计算结果错误。例如5/2+3/2=3, (5+3)/2=4
        q = ((p & r) + ((p ^ r) >> 1)); // 原理是？
        merge_sort(A, p, q, length);
        merge_sort(A, q+1, r, length);
        merge(A, p, q, r, length);
    }
}

+ (void)mergeSortWithArray:(int*)array length:(int)length {
    merge_sort(array, 0, length-1, length);
}

#define swap(a,b) {if(a!=b){(a)^=(b); (b)^=(a); (a)^=(b);}}
void heapSort(int *num, int length)
{
    int key, i, j;
    
    for (i = 0; i < length-1; i++)
    {
        key = i;
        for (j = i; j < length; j++)
        {
            if (num[j] < num[key])
            {
                key = j;
            }
        }
        swap(num[i], num[key]);
    }
}
// 堆排序,也叫选择排序
+ (void)heapSortWithArray:(int*)array length:(int)length {
    heapSort(array, length);
}

// 打印数组
+ (void)printWithArray:(int*)array length:(int)length {
    int i;
    printf("开始打印--> ");
    for(i = 0; i < length; i++) {
        printf("%2d ", array[i]);
    }
    printf("<--结束打印 \n");
}

// 字符串反转
// 功能：实现a和b的交换
// 参数：a和b
// 返回：空
void swapForChar(char &a, char &b)
{
    // 异或运算
    // a = 3 = 0011; b = 4 = 0100;
    // a = 0011 ^ 0100 = 0111 = 7
    // b = 0111 ^ 0100 = 0011 = 3
    // a = 0111 ^ 0011 = 0100 = 4
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
}

+ (void)reverseForChar:(char*)ch {
    /** 方式一
     size_t n = strlen(ch);
     for(int i = 0; i < n / 2; i++)
     {
     swapForChar(ch[i], ch[n - i - 1]);
     }
     */
    
    if (!ch) {
        return;
    }
    
    char* p = ch;
    char* q = ch;
    
    while (*q) {
        q++;
    }
    
    --q;
    
    while (p < q) {
        swapForChar(*p++, *q--);
    }
}

// 去除字符串中重复字符
+ (void)removeRepeadtChar:(char*)input output:(char*)output {
    
    if ((input == NULL) || (output == NULL)) {
        return;
    }
    
    int flag, k = 0;
    size_t length = strlen(input);
    for (size_t i=0; i<length; i++) {
        flag = 1;
        for (size_t j=0; j<i; j++) {
            if (input[i] == output[j]) {
                flag = 0;
            }
        }
        if (flag) {
            output[k++] = input[i];
        }
    }
    
    output[k] = '\0';
    puts(output);
}

// --------- 优雅的分界线 ---------
// 计算连续最大和的子数组
+ (NSArray*)maxPlusWithArray:(NSArray*)oArr {
    
    // 直接返回
    if (oArr.count < 2) {
        return oArr;
    }
    
    // 记录最大值的变量
    NSArray* kMaxPlusArr = nil;
    
    {
        // 原始长度
        NSInteger oCount = oArr.count;
        for (NSInteger i=0; i<oCount; i++) {
            // 临时数组
            NSMutableArray* otherArrM = [NSMutableArray array];
            
            for (NSInteger j=i; j<oCount; j++) {
                [otherArrM addObject:oArr[j]];
            }
            // 这个值很重要, 保留每次刚开始的那个长度, 以便下一个for循环的遍历
            NSInteger otherCount = otherArrM.count;
            // 头元素递减遍历
            for (NSInteger j=otherCount-1; j>0; j--) {
                // 临时中间数组
                NSMutableArray* midArrM = [NSMutableArray array];
                for (NSInteger k=0; k<otherArrM.count-1; k++) {
                    [midArrM addObject:otherArrM[k]];
                }
                
                // 保留最大值
                kMaxPlusArr = [self maxPlusWithArray:midArrM kMaxPlusArr:kMaxPlusArr];
                
                // 变变变了
                otherArrM = midArrM;
            }
        }
    }
    
    // 返回
    return kMaxPlusArr;
}


// 计算一个数组在第一个元素不变, 但是长度变短过程中最大的数组
+ (NSArray*)maxPlusWithArray:(NSArray*)array kMaxPlusArr:(NSArray*)kMaxPlusArr {
    for (NSInteger i=array.count-1; i>=0; i--) {
        NSMutableArray* midArray = [NSMutableArray array];
        for (NSInteger j=0; j<i; j++) {
            [midArray addObject:array[j]];
        }
        
        // 和
        NSInteger plus = [self plusWithArray:midArray];
        NSInteger maxPlus = [self plusWithArray:kMaxPlusArr];
        
        if (plus > maxPlus) {
            kMaxPlusArr = midArray;
        }
    }
    
    return kMaxPlusArr;
}



// 计算一个数组的总和
+ (NSInteger)plusWithArray:(NSArray*)array {
    NSInteger plus = 0;
    for (NSNumber* num in array) {
        plus += num.integerValue;
    }
    return plus;
}

@end

