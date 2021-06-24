//
//  LoginViewController.m
//  LegalAssistant
//
//  Created by lang on 2021/6/17.
//

#import "LoginViewController.h"
#import "TTTAttributedLabel.h"
@interface LoginViewController ()<UITextFieldDelegate,TTTAttributedLabelDelegate>
{
    bool changPrivacyImgFlag;
}
@property(nonatomic,strong) UITextField *tefPhoneTxtField;
@property(nonatomic,strong) UITextField *codePhoneTxtField;
@property(nonatomic,strong) UIButton *loginBtn;
@property(nonatomic,strong) UIButton *codeBtn;
@property(nonatomic,strong) UIButton *privacyBtn;
@property(nonatomic,strong) UIView *txtFldBgOneView;
@property(nonatomic,strong) UILabel *registeredLab;
@end

@implementation LoginViewController
@synthesize loginBtn,codeBtn,privacyBtn,txtFldBgOneView,registeredLab;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(20,133,104,33);
    [self.view addSubview:titleLabel];
    NSMutableAttributedString *titlStr = [[NSMutableAttributedString alloc] initWithString:@"欢迎登录!"attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(24)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    titleLabel.attributedText = titlStr;
    titleLabel.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(20));
        make.top.equalTo(self.view).offset(GCH(133));
        make.width.mas_equalTo(GCW(110));
        make.height.mas_equalTo(GCH(33));
    }];
    
    UILabel *txtlabel = [[UILabel alloc] init];
    txtlabel.frame = CGRectMake(20,174,70,20);
    [self.view addSubview:txtlabel];
    NSMutableAttributedString *txtStr = [[NSMutableAttributedString alloc] initWithString:@"登录即注册"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    txtlabel.attributedText = txtStr;
    txtlabel.textColor = [UIColor colorWithRed:137/255.0 green:147/255.0 blue:164/255.0 alpha:1.0];
    [txtlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(20));
        make.top.equalTo(titleLabel.mas_bottom).offset(GCH(8));
        make.width.mas_equalTo(GCW(70));
        make.height.mas_equalTo(GCH(20));
    }];
    
    UILabel *numbLab = [[UILabel alloc] init];
    numbLab.frame = CGRectMake(19.6,231,42,20);
    [self.view addSubview:numbLab];
    NSMutableAttributedString *numbString = [[NSMutableAttributedString alloc] initWithString:@"手机号"attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    numbLab.attributedText = numbString;
    numbLab.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [numbLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(20));
        make.top.equalTo(txtlabel.mas_bottom).offset(GCH(37));
        make.width.mas_equalTo(GCW(50));
        make.height.mas_equalTo(GCH(20));
    }];
    
    //手机号背景框
    txtFldBgOneView = [[UIView alloc] init];
    txtFldBgOneView.userInteractionEnabled = YES;
    txtFldBgOneView.layer.cornerRadius = 9.5;
    txtFldBgOneView.layer.borderWidth = 1;
    txtFldBgOneView.layer.borderColor = RGB(223, 225, 230).CGColor;
    [self.view addSubview:txtFldBgOneView];
    [txtFldBgOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(21));
        make.top.equalTo(numbLab.mas_bottom).offset(GCH(12));
        make.width.mas_equalTo(GCW(334));
        make.height.mas_equalTo(GCH(49));
    }];
    
    //手机号TxtField
    _tefPhoneTxtField = [UITextField new];
    _tefPhoneTxtField.keyboardType = UIKeyboardTypeNumberPad;
    _tefPhoneTxtField.userInteractionEnabled = YES;
    _tefPhoneTxtField.enabled = YES;
    _tefPhoneTxtField.tag = 1;
//    _tefPhoneTxtField.delegate = self;
    [self.view addSubview:_tefPhoneTxtField];
    NSMutableAttributedString *holderTextStr = [[NSMutableAttributedString alloc] initWithString:@"请输入手机号" attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName: [UIColor colorWithRed:179/255.0 green:186/255.0 blue:197/255.0 alpha:1.0]}];
    _tefPhoneTxtField.attributedPlaceholder = holderTextStr;
    [_tefPhoneTxtField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_tefPhoneTxtField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(36));
        make.top.equalTo(numbLab.mas_bottom).offset(GCH(12));
        make.width.mas_equalTo(GCW(200));
        make.height.mas_equalTo(GCH(49));
    }];
    
    //手机号已注册
    registeredLab = [[UILabel alloc] init];
    [self.view addSubview:registeredLab];
    registeredLab.hidden = YES;
    NSMutableAttributedString *registeredStr = [[NSMutableAttributedString alloc] initWithString:@"该账号已注册"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:GCW(12)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    registeredLab.attributedText = registeredStr;
    registeredLab.textColor = [UIColor colorWithRed:255/255.0 green:78/255.0 blue:0/255.0 alpha:1.0];
    [registeredLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(GCW(-20));
        make.top.equalTo(txtFldBgOneView.mas_bottom).offset(GCH(8));
        make.width.mas_equalTo(GCW(72));
        make.height.mas_equalTo(GCH(17));
    }];
    
    //验证码背景框
    UILabel *codeLab = [[UILabel alloc] init];
    [self.view addSubview:codeLab];
    NSMutableAttributedString *codeStr = [[NSMutableAttributedString alloc] initWithString:@"验证码"attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
    codeLab.attributedText = codeStr;
    codeLab.textColor = [UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1.0];
    [codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(20));
        make.top.equalTo(_tefPhoneTxtField.mas_bottom).offset(GCH(32));
        make.width.mas_equalTo(GCW(50));
        make.height.mas_equalTo(GCH(20));
    }];
    
    //验证码背景框
    UIView *txtFldBgTwoView = [[UIView alloc] init];
    txtFldBgTwoView.userInteractionEnabled = YES;
    txtFldBgTwoView.layer.cornerRadius = 9.5;
    txtFldBgTwoView.layer.borderWidth = 1;
    txtFldBgTwoView.layer.borderColor = RGB(223, 225, 230).CGColor;
    [self.view addSubview:txtFldBgTwoView];
    [txtFldBgTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(21));
        make.top.equalTo(codeLab.mas_bottom).offset(GCH(12));
        make.width.mas_equalTo(GCW(334));
        make.height.mas_equalTo(GCH(49));
    }];
    
    //验证码TxtField
    _codePhoneTxtField = [UITextField new];
    _codePhoneTxtField.keyboardType = UIKeyboardTypeNumberPad;
    _codePhoneTxtField.tag = 2;
//    _codePhoneTxtField.delegate = self;
    [self.view addSubview:_codePhoneTxtField];
    NSMutableAttributedString *codeTextStr = [[NSMutableAttributedString alloc] initWithString:@"请输入验证码" attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName: [UIColor colorWithRed:179/255.0 green:186/255.0 blue:197/255.0 alpha:1.0]}];
    _codePhoneTxtField.attributedPlaceholder = codeTextStr;
    [_codePhoneTxtField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_codePhoneTxtField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(36));
        make.top.equalTo(codeLab.mas_bottom).offset(GCH(12));
        make.width.mas_equalTo(GCW(200));
        make.height.mas_equalTo(GCH(49));
    }];
    //获取验证码
    codeBtn = [[UIButton alloc] init];
    codeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [txtFldBgTwoView addSubview:codeBtn];
    NSMutableAttributedString *codeString = [[NSMutableAttributedString alloc] initWithString:@"获取验证码"attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:101/255.0 blue:255/255.0 alpha:1.0]}];
    [codeBtn setAttributedTitle:codeString forState:UIControlStateNormal];
    [codeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [codeBtn addTarget:self action:@selector(doSendCode) forControlEvents:UIControlEventTouchUpInside];
    [codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(txtFldBgTwoView).with.offset(GCW(-13));
        make.centerY.equalTo(txtFldBgTwoView);
        make.width.mas_equalTo(GCW(80));
        make.height.mas_equalTo(GCH(20));
    }];
    
    //语音验证富本文
    TTTAttributedLabel *voiceLab = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    voiceLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:GCW(13)];
    voiceLab.textColor = RGB(23, 43, 77);
    voiceLab.lineBreakMode = NSLineBreakByWordWrapping;
    voiceLab.delegate = self;
    NSString *voiceTxt = @"您也可以尝试接听语音验证";
    [self.view addSubview:voiceLab];
    voiceLab.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    [voiceLab setText:voiceTxt afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"语音验证" options:NSCaseInsensitiveSearch];
        UIFont *boldSystemFont = [UIFont fontWithName:@"PingFangSC-Regular" size:GCW(13)];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:boldRange];
            [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)RGB(46, 99, 236).CGColor range:boldRange];
            CFRelease(font);
        }
        return mutableAttributedString;
    }];
    [voiceLab addLinkToPhoneNumber:@"语音验证" withRange:NSMakeRange(8, 4)];
    [voiceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(GCW(-20));
        make.top.equalTo(txtFldBgTwoView.mas_bottom).offset(GCH(10));
        make.width.mas_equalTo(GCW(160));
        make.height.mas_equalTo(GCH(18));
    }];
    
    //登录按钮
    loginBtn = [[UIButton alloc] init];
    loginBtn.layer.backgroundColor = [UIColor colorWithRed:46/255.0 green:99/255.0 blue:236/255.0 alpha:1.0].CGColor;
    loginBtn.layer.cornerRadius = 10;
    [self.view addSubview:loginBtn];
    NSMutableAttributedString *loginStr = [[NSMutableAttributedString alloc] initWithString:@"登录"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: GCW(15)],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    [loginBtn setAttributedTitle:loginStr forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [loginBtn addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(20));
        make.top.equalTo(_codePhoneTxtField.mas_bottom).offset(GCH(64));
        make.width.mas_equalTo(GCW(335));
        make.height.mas_equalTo(GCH(45));
    }];
    
    //改变隐私图片Btn
    changPrivacyImgFlag = NO;
    privacyBtn = [[UIButton alloc] init];
    privacyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [privacyBtn setBackgroundImage:[UIImage imageNamed:@"unClick_privacy"] forState:UIControlStateNormal];
    [self.view addSubview:privacyBtn];
    [privacyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [privacyBtn addTarget:self action:@selector(doChangeImage) forControlEvents:UIControlEventTouchUpInside];
    [privacyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(GCW(19));
        make.top.equalTo(loginBtn.mas_bottom).offset(GCH(11));
        make.width.mas_equalTo(GCW(18));
        make.height.mas_equalTo(GCH(18));
    }];
    
    //隐私富本文
    TTTAttributedLabel *privacyLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    privacyLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:GCW(12)];
    privacyLabel.textColor = RGB(179, 186, 197);
    privacyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    privacyLabel.delegate = self;
    NSString *privacyTxt = @"我已阅读并同意 服务条款 和 隐私政策";
    [self.view addSubview:privacyLabel];
    privacyLabel.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    [privacyLabel setText:privacyTxt afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"服务条款" options:NSCaseInsensitiveSearch];
        NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"隐私政策" options:NSCaseInsensitiveSearch];
        UIFont *boldSystemFont = [UIFont fontWithName:@"PingFangSC-Regular" size:GCW(12)];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:boldRange];
            [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1] CGColor] range:boldRange];
            [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWithRed:23/255.0 green:43/255.0 blue:77/255.0 alpha:1] CGColor] range:strikeRange];
            CFRelease(font);
        }
        return mutableAttributedString;
    }];
    [privacyLabel addLinkToPhoneNumber:@"服务条款" withRange:NSMakeRange(8, 4)];
    [privacyLabel addLinkToPhoneNumber:@"隐私政策" withRange:NSMakeRange(15, 4)];
    [privacyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(privacyBtn.mas_right).with.offset(GCW(7));
        make.top.equalTo(loginBtn.mas_bottom).offset(GCH(12));
        make.width.mas_equalTo(GCW(220));
        make.height.mas_equalTo(GCH(17));
    }];
}

#pragma mark - UITextFieldDelegate
//- (void)textViewDidChange:(UITextView *)textView { // 在该代理方法中实现实时监听uitextview的输入
////    if (textView.text.length>10) {
////        [TipsTool showTipsOnView:self.view message:@"不能超过10"];
////    }
////    self.remindLab.text = [NSString stringWithFormat:@"%zd/10",textView.text.length];
////    self.navigationItem.rightBarButtonItem.enabled = textView.text.length>0 && textView.text.length<=300;
//
//}

- (void)textFieldDidChange:(UITextField *)textField {
    if (textField.tag == 1 && textField.text.length == 11) {
        NSLog(@"sdfasf");
    }
}



#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
    NSLog(@"%@",phoneNumber);
    if ([phoneNumber isEqualToString:@"语音验证"]) {
        
    }else if([phoneNumber isEqualToString:@"服务条款"]){
        
    }else if([phoneNumber isEqualToString:@"隐私政策"]){
        
    }
}

#pragma mark - 登录按钮
- (void)doLogin
{
    txtFldBgOneView.layer.borderColor = RGB(255, 78, 0).CGColor;
    registeredLab.hidden = NO;
}

#pragma mark - 改变隐私选中图片
- (void)doChangeImage
{
    changPrivacyImgFlag = !changPrivacyImgFlag;
    if (changPrivacyImgFlag) {
        [privacyBtn setBackgroundImage:[UIImage imageNamed:@"click_privacy"] forState:UIControlStateNormal];
    }else{
        [privacyBtn setBackgroundImage:[UIImage imageNamed:@"unClick_privacy"] forState:UIControlStateNormal];
    }
}

#pragma mark - 发送验证码
- (void)doSendCode
{
    __block NSInteger second = 60;
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second == 0) {
                self.codeBtn.userInteractionEnabled = YES;
                NSMutableAttributedString *codeString = [[NSMutableAttributedString alloc] initWithString:@"获取验证码"attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:101/255.0 blue:255/255.0 alpha:1.0]}];
                [self->codeBtn setAttributedTitle:codeString forState:UIControlStateNormal];
                second = 60;
                dispatch_cancel(timer);
            } else {
                self.codeBtn.userInteractionEnabled = NO;
                NSMutableAttributedString *codeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ldS",second] attributes: @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:GCW(14)],NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:101/255.0 blue:255/255.0 alpha:1.0]}];
                [self->codeBtn setAttributedTitle:codeString forState:UIControlStateNormal];
                second--;
            }
        });
    });
    dispatch_resume(timer);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tefPhoneTxtField resignFirstResponder];
    [_codePhoneTxtField resignFirstResponder];
}
@end
