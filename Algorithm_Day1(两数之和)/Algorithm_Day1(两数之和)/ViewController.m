//
//  ViewController.m
//  Algorithm_Day1(两数之和)
//
//  Created by penghe on 2018/7/12.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *tempArray = [self twoSumNums:@[@(2), @(7), @(11), @(15)] target:9];
    NSLog(@"%@",tempArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 复杂度分析：
 
 时间复杂度：O(n^2)， 对于每个元素，我们试图通过遍历数组的其余部分来寻找它所对应的目标元素，这将耗费 O(n) 的时间。因此时间复杂度为 O(n^2)
 ​​ )。
 
 空间复杂度：O(1)。

 */

/*
- (NSArray *)twoSumNums:(NSArray *)nums target:(int)target
{
    NSArray *tempResultsArray;
    for (int i = 0; i < nums.count; i++)
    {
        for (int j = i+1; j<nums.count; j++)
        {
            int tempNum = target - [nums[i] intValue];
            if ( tempNum == [nums[j] intValue])
            {
                tempResultsArray = @[@(i),@(j)];
                return tempResultsArray;

            }
        }
    }
       return nil;

}
*/

/*
 时间复杂度：O(n)， 我们把包含有 n 个元素的列表遍历两次。由于哈希表将查找时间缩短到 O(1) ，所以时间复杂度为 O(n)。
 
 空间复杂度：O(n)， 所需的额外空间取决于哈希表中存储的元素数量，该表中存储了 n个元素。
 */

- (NSArray *)twoSumNums:(NSArray *)nums target:(int)target
{
    NSInteger arrayCount = nums.count;
    
    //创建一个字典 类似哈希表 便于快速查找 把数组里面的元素放到字典里面
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:arrayCount];
    for (int i = 0; i<arrayCount; i++)
    {
        [tempDic setValue:nums[i] forKey:[@(i) stringValue]];
    }
    //我们将检查每个元素所对应的目标元素（target - nums[i]target−nums[i]）是否存在于表中。注意，该目标元素不能是 nums[i]nums[i] 本身！
    for (int i = 0; i<arrayCount; i++)
    {
        int complement = target - [nums[i] intValue];
        //字典所有value
        NSArray *dicAllValuesArray = [tempDic allValues];
        //某个value 在数组中的索引值
        NSUInteger indexOfObject = [[tempDic allValues] indexOfObject:@(complement)];
        if ([dicAllValuesArray containsObject:@(complement)] && indexOfObject !=i  )
        {
            NSArray *tempResultsArray = @[@(i),@(indexOfObject)];
            return tempResultsArray;

        }
        
    }
    return nil;
}


/*
  在把数组里面的元素放入字典之前就判断字典里面是否有这些元素 时间复杂度：O(n)， 我们只遍历了包含有 n 个元素的列表一次。在表中进行的每次查找只花费 O(1) 的时间。

  空间复杂度：O(n)， 所需的额外空间取决于哈希表中存储的元素数量，该表最多需要存储 n 个元素
 */

/*
- (NSArray *)twoSumNums:(NSArray *)nums target:(int)target
{
    //数组的count 值
    NSInteger arrayCount = nums.count;
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:arrayCount];
    
    for (int i = 0; i<arrayCount; i++)
    {
        int complement = target - [nums[i] intValue];
        //字典所有value
        NSArray *dicAllValuesArray = [tempDic allValues];
        //某个value 在数组中的索引值
        NSUInteger indexOfObject = [[tempDic allValues] indexOfObject:@(complement)];
        if ([dicAllValuesArray containsObject:@(complement)] && indexOfObject !=i  )
        {
            NSArray *tempResultsArray = @[@(i),@(indexOfObject)];
            return tempResultsArray;
            
        }
        [tempDic setValue:nums[i] forKey:[@(i) stringValue]];

    }
    return nil;

}
 */
@end
