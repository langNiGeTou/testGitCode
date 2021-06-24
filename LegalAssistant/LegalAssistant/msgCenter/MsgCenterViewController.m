//
//  ThreeViewController.m
//  gitTest
//
//  Created by 17090416 on 2021/4/8.
//

#import "MsgCenterViewController.h"
#import "SACommon.h"
#import "UIColor+extend.h"
@interface MsgCenterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation MsgCenterViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"PingFangSC-Semibold" size:GCW(10)],NSFontAttributeName,[UIColor getColor:@"0065FF"],NSForegroundColorAttributeName,nil];
        [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
        self.tabBarItem.image = [UIImage imageNamed:@"msg"] ;
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"selected_msg"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        self.tabBarItem.title = @"消息中心";
        [self.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *collectionFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionFlowLayout.minimumLineSpacing = 10;
    collectionFlowLayout.minimumInteritemSpacing = 10;
    collectionFlowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    
    
    UICollectionView *clctV = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:collectionFlowLayout];
    clctV.delegate = self;
    clctV.dataSource = self;
    [clctV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:clctV];
    
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 200;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cCell.backgroundColor = [UIColor redColor];
    return cCell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    }
    
}


@end
