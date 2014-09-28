//
//  AddressViewController2.m
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AddressViewController2.h"

@interface AddressViewController2 ()

@end

@implementation AddressViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithTitle:(NSString *)str uid:(NSString *)uid
{
    self = [super initWithTitle:str uid:uid];
    if (self) {
        //
        self.requestModel = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectRightAction:)];
    self.rightButton.image = [UIImage imageNamed:@"保存.png"];
    self.rightButton.tintColor = [UIColor whiteColor];
    self.item.rightBarButtonItem = self.rightButton;
    
    
    // Do any additional setup after loading the view.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)selectRightAction:(id)sender
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kAddressChange" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:self.nameTf.text,@"name",self.telTf.text,@"tel",self.addrTf.text,@"address", nil]];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
