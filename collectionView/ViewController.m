//
//  ViewController.m
//  collectionView
//
//  Created by PatrickY on 2018/3/15.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "DemoCollectionViewCell.h"

#define COL_NUM 3   //collectView 列数
NSString *const cellIdentifier = @"cellIdentifier";   //重用标识符

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray                           *array;

@end

@implementation ViewController {
    UICollectionView                                            *_collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    
    self.array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    [self setupCollectionView];
    
}

- (void)setupCollectionView {
    
    //创建流布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置cell尺寸
    layout.itemSize = CGSizeMake(80, 80);
    //设置collectionView内边距
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 30, 15);
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    //设置不同机型
    if (screenSize.height > 568) {
        layout.itemSize = CGSizeMake(100, 100);
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 15);
    }
    //单元格间距
    layout.minimumInteritemSpacing = 10;
    
    _collectionView = [[UICollectionView  alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    //设置可重用标识符以及单元格类型
    [_collectionView registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource =self;
    
    [self.view addSubview:_collectionView];


}


#pragma UICollectionViewDelegate, UICollectionViewDataSource

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = self.array[indexPath.section * COL_NUM + indexPath.row];
    
    NSLog(@"%@", dict[@"name"]);
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    int num = [self.array count] % COL_NUM;
    
    if (num == 0) {
        return [self.array count] / COL_NUM;
    }else {
        return [self.array count] / COL_NUM + 1;
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return COL_NUM;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSInteger idx = indexPath.section * COL_NUM + indexPath.row;
    //防止下标越界
    if (self.array.count <= idx) {
        return cell;
    }
    NSDictionary *dict = self.array[idx];
    
    cell.label.text = [dict objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:dict[@"image"]];
    
    return cell;
    
}



@end
