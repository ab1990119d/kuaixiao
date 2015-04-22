//
//  AutoFormView.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/17.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "AutoFormView.h"

@implementation AutoFormView

-(void)initDataView{
    
    CGRect scrolFrame = self.frame;
    
    UIScrollView *scrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, scrolFrame.size.height)];
    scrollview.backgroundColor=[UIColor whiteColor];
    
    scrollview.pagingEnabled=YES;//是否自己动适应
    
    for(int i=0;i<self.formFields.count;i++){
        FormField  *formField = [self.formFields objectAtIndex:i];
       
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(2, self.height, ScreenWidth, LADBL_HEIGHT)];
        label.text = formField.label;
        self.height = self.height +LADBL_HEIGHT;
        
         _formDefId = formField.formDefId;
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height,ScreenWidth, 0.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        
        [scrollview addSubview:label];
        
        [scrollview addSubview:lineView];
        
        //  控件类型:-1分割线, 1单行文本框, 2多行文本框, 3单选框, 5下拉, 6附近(图片)
        switch (formField.inputType) {
            case -1:{
                //分割线
                CLog(@"添加分割线");
            }
                break;
            case 1:{
                //单行文本框
                CLog(@"添加单行文本框");
                CGRect frame = CGRectMake(5, self.height+5, ScreenWidth-10, NORMAL);
                UITextField *filedView = [[UITextField alloc]initWithFrame:frame];
                filedView.borderStyle = UITextBorderStyleRoundedRect;
                filedView.tag = i +1000;
                UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
                [topView setBarStyle:UIBarStyleDefault];
                UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard:)];
                doneButton.tag = i +1000 +3000;
                NSArray * buttonsArray = [NSArray arrayWithObjects: doneButton, nil];
                [topView setItems:buttonsArray];
                
                filedView.text = formField.fieldVal;
                filedView.delegate = self;
                
                switch (formField.dataType) {
                    case 1:{
                        //字符
                        CLog(@"字符");
                        [filedView setInputAccessoryView:topView];
                    }
                        break;
                    case 2:{
                        //整数
                        CLog(@"整数");
                        filedView.keyboardType=UIKeyboardTypeNumberPad;
                        [filedView setInputAccessoryView:topView];
                    }
                        break;
                    case 3:{
                        //double
                        CLog(@"double");
                        filedView.keyboardType=UIKeyboardTypeNumberPad;
                        [filedView setInputAccessoryView:topView];
                    }
                        break;
                    case 4:{
                        //日期 跟下拉框相同
                        CLog(@"日期");
                        
                        NSDate *date=[NSDate date];
                        SelectView  *pickview=[[SelectView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
                        pickview.delegate = self;
                        
                        pickview.tag = i;
                        
                        CGRect btFrame =CGRectMake(0, 0, 20, 20);
                        
                        UIButton *bt = [[UIButton alloc]initWithFrame:btFrame];
                        [bt setImage:[UIImage imageNamed:@"unselected@2x.png"]forState:UIControlStateNormal];
                        [bt addTarget:self action:@selector(pickSelectBt:) forControlEvents:UIControlEventTouchUpInside];
                        NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
                        [parmas setObject:pickview forKey:@"pickview"];
                        [bt setParam:parmas];
                        
                        filedView.rightView = bt;
                        filedView.rightViewMode = UITextFieldViewModeAlways;
                        filedView.borderStyle = UITextBorderStyleRoundedRect;
                        filedView.placeholder= @"请选择时间！";
                        [filedView setEnabled:YES];
                        filedView.tag = i +5000;
                    }
                        break;
                    default:
                        break;
                }
                
                [scrollview addSubview:filedView];
                
                self.height = self.height +NORMAL+5;
            }
                break;
            case 2:{
                //多行文本框
                CLog(@"添加多行文本框");
                CGRect frame = CGRectMake(5, self.height+5, ScreenWidth-10, TEXT_FIELD_HEIGHT);
                LXHTextFieldView *textFieldView = [[LXHTextFieldView alloc]initWithFrame:frame limitNumber:formField.maxVal];
                
                textFieldView.placeholder = [@"请录入：" stringByAppendingString:formField.label ];
                
                textFieldView.tag = i + 2000;
                
                textFieldView.delegate = self;
                textFieldView.textView.text = formField.fieldVal;
                
                [scrollview addSubview:textFieldView];
                
                self.height = self.height +TEXT_FIELD_HEIGHT+5;
            }
                break;
            case 3:{
                //单选框  单选框的tag 为值
                CLog(@"添加单选框");
                NSArray *formFieldItem = formField.formFieldItemList;
                
                for(int j=0;j<formFieldItem.count;j++){
                    FormFieldItem *fieldItem = [formFieldItem objectAtIndex:j];
                    NSString *fieldI = [[NSString alloc]initWithFormat:@"%d",i];
                    NSString *itemId = [[NSString alloc]initWithFormat:@"%ld",fieldItem.itemId];
                    
                    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
                    
                    label.numberOfLines = 0;
                    
                    label.lineBreakMode = NSLineBreakByWordWrapping;
                    
                    label.text = fieldItem.itemLabel;
                    
                    CGSize size = [label sizeThatFits:CGSizeMake(ScreenWidth-20, MAXFLOAT)];
                    
                    CGRect frame =CGRectMake(20, 0, ScreenWidth-20, size.height);
                    label.frame = frame;
                    
                    label.font = [UIFont systemFontOfSize:14];
                    
                    CGRect btFrame =CGRectMake(0, self.height+5, ScreenWidth-10, size.height);
                    
                    QRadioButton *_radioBT = [[QRadioButton alloc] initWithDelegate:self groupId:fieldI];
                    _radioBT.frame = btFrame;
                    _radioBT.tag = fieldItem.itemId+ 3000;
                    if ([itemId isEqualToString:formField.fieldVal]) {
                        _radioBT.checked =YES;
                    }
                    _radioBT.delegate = self;
                    [_radioBT addSubview:label];
                    
                    [scrollview addSubview:_radioBT];
                    
                    self.height = self.height +5+ size.height;
                }
                
            }
                break;
            case 4:{
                //多选框  button中传递参数
                CLog(@"添加多选框");
                
                NSArray *formFieldItem = formField.formFieldItemList;
                
                for(int j=0;j<formFieldItem.count;j++){
                    FormFieldItem *fieldItem = [formFieldItem objectAtIndex:j];
                    
                    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
                    
                    label.numberOfLines = 0;
                    
                    label.lineBreakMode = NSLineBreakByWordWrapping;
                    
                    label.text = fieldItem.itemLabel;
                    
                    CGSize size = [label sizeThatFits:CGSizeMake(ScreenWidth-20, MAXFLOAT)];
                    
                    CGRect frame =CGRectMake(20, 0, ScreenWidth-20, size.height);
                    label.frame = frame;
                    
                    label.font = [UIFont systemFontOfSize:14];
                    
                    CGRect btFrame =CGRectMake(0, self.height +5, ScreenWidth-10, size.height);
                    
                    UIButton *bt = [[UIButton alloc]initWithFrame:btFrame];
                    [bt layoutIfNeeded];
                    
                    [bt setImage:[UIImage imageNamed:@"unselected@2x.png"]forState:UIControlStateNormal];
                    [bt setImage:[UIImage imageNamed:@"isselected@2x.png"]forState:UIControlStateSelected];
                    
                    bt.imageEdgeInsets = UIEdgeInsetsMake(0,-ScreenWidth+30,0,0);
                    
                    [bt addSubview:label];
                    
                    [bt addTarget:self action:@selector(selectBt:) forControlEvents:UIControlEventTouchUpInside];
                    
                    if (![formField.fieldVal isEqualToString:@""]&&formField.fieldVal!=nil) {
                        NSArray *formVal =[formField.fieldVal componentsSeparatedByString:@","];
                        for(int k=0;k<formVal.count;k++){
                            NSString *itemId =[formVal objectAtIndex:k];
                            
                            if ([itemId isEqualToString:[[NSString alloc] initWithFormat:@"%ld" ,fieldItem.itemId ]]) {
                                bt.selected = YES;
                            }
                        }
                    }
                    NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
                    
                    [parmas setObject:[[NSString alloc] initWithFormat:@"%ld" ,fieldItem.itemId ] forKey:@"fieldItemId"];
                    [parmas setObject:[[NSString alloc] initWithFormat:@"%d" ,i] forKey:@"fieldId"];
                    [bt setParam:parmas];
                    
                    [scrollview addSubview:bt];
                    
                    self.height = self.height +5+ size.height;
                    
                }
            }
                break;
            case 5:{
                //下拉
                CLog(@"添加下拉");
                NSArray *formFieldItems = formField.formFieldItemList;
                
                SelectView  *pickview=[[SelectView alloc] initPickviewWithFormFieldItem:formFieldItems isHaveNavControler:NO];
                pickview.delegate = self;
                
                pickview.tag = i;
                
                CGRect frame = CGRectMake(5, self.height+5, ScreenWidth-10, NORMAL);
                UITextField *filedView = [[UITextField alloc]initWithFrame:frame];
                
                CGRect btFrame =CGRectMake(0, 0, 20, 20);
                
                UIButton *bt = [[UIButton alloc]initWithFrame:btFrame];
                [bt setImage:[UIImage imageNamed:@"unselected@2x.png"]forState:UIControlStateNormal];
                [bt addTarget:self action:@selector(pickSelectBt:) forControlEvents:UIControlEventTouchUpInside];
                NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
                [parmas setObject:pickview forKey:@"pickview"];
                [bt setParam:parmas];
                
                for(int k=0;k<formFieldItems.count;k++){
                    FormFieldItem *item =[formFieldItems objectAtIndex:k];
                    if ([formField.fieldVal isEqualToString:[[NSString alloc] initWithFormat:@"%ld" ,item.itemId ]]) {
                        filedView.text = item.itemLabel;
                    }
                }
                
                filedView.rightView = bt;
                filedView.rightViewMode = UITextFieldViewModeAlways;
                filedView.borderStyle = UITextBorderStyleRoundedRect;
                filedView.placeholder= @"请选择！";
                [filedView setEnabled:YES];
                filedView.tag = i +5000;
                
                [scrollview addSubview:filedView];
                self.height = self.height +NORMAL+5;
                
            }
                break;
            case 6:{
                //附近(图片)
                CLog(@"添加图片");
                
                CGRect frame = CGRectMake(5, self.height+5, ScreenWidth-10, PHONTO_VIEW_HEIGHT);
                
                self.height = self.height +PHONTO_VIEW_HEIGHT+5;
                
                MessagePhotoView *photoView = [[MessagePhotoView alloc]initWithFrame:frame];
                
                photoView.delegate =self;
                
                //加载图片
                if (![formField.fieldVal isEqualToString:@""]&&formField.fieldVal!=nil) {
                    NSArray *imageUrls =[formField.fieldVal componentsSeparatedByString:@","];
                    for(int k=0;k<imageUrls.count;k++){
                        NSString *imageUrl =[imageUrls objectAtIndex:k];
                        
                        NSData *data = [NetWorkUtil down:imageUrl];
                        
                        UIImage *image = [[UIImage alloc]initWithData:data];
                        
                        NSDictionary *dicImage = @{@"image":image,@"filePath":imageUrl};
                        
                        [photoView reloadDataWithImage:dicImage];
                        
                    }
                }
                
                NSMutableDictionary *imageDictionary = [NSMutableDictionary new];
                
                //向词典中动态添加数据
                [imageDictionary setObject:photoView forKey:@"photoView"];
                
                [imageDictionary setObject:[[NSString alloc]initWithFormat:@"%d" ,i ] forKey:@"fieldI"];
                
                [_imageFields addObject:imageDictionary];
                
                [scrollview addSubview:photoView];
            }
                break;
            default:
                break;
        }
        
        scrollview.contentSize=CGSizeMake(ScreenWidth,self.height);
        
        [self addSubview:scrollview];
        
        scrollview.maximumZoomScale=2.0;
        
        scrollview.minimumZoomScale=0.5;
    }
}

//相册的  实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{
    
    if ([self.delegate respondsToSelector:@selector(addPicker:)]) {
        [self.delegate addPicker:picker];
    }
}

-(void)dismissKeyBoard:(UIBarButtonItem *)bt{
    UITextField *filedView = (UITextField *)[self viewWithTag:bt.tag - 3000];
    
    FormField  *formField = [self.formFields objectAtIndex:bt.tag - 4000];
    formField.fieldVal = filedView.text;
    
    [filedView resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    FormField  *formField = [self.formFields objectAtIndex:textField.tag - 1000];
    formField.fieldVal = textField.text;
}


//多选返回
-(void)selectBt:(UIButton *)bt{
    NSMutableDictionary *parms= [(UIButton *) bt param];
    NSString  *itemId = [parms objectForKey:@"fieldItemId"];
    NSString  *fieldId = [parms objectForKey:@"fieldId"];
    FormField  *formField = [self.formFields objectAtIndex:[fieldId integerValue]];
    
    NSMutableArray *value = [NSMutableArray new];
    if (![formField.fieldVal isEqualToString:@""]) {
        NSArray *selectValue = [formField.fieldVal componentsSeparatedByString:@","];
        value =[NSMutableArray arrayWithArray:selectValue];
    }
    
    if (bt.selected) {
        bt.selected = NO;
        [value removeObject:itemId];
    }else{
        bt.selected = YES;
        [value addObject:itemId];
    }
    
    formField.fieldVal =[value componentsJoinedByString:@","];
}


-(void)pickSelectBt:(UIButton *)bt{
    NSMutableDictionary *parms= [(UIButton *) bt param];
    SelectView  *pickview = [parms objectForKey:@"pickview"];
    [pickview show];
}

#pragma mark - QRadioButtonDelegate 单选
- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId {
    FormField  *formField = [self.formFields objectAtIndex:[groupId integerValue]];
    formField.fieldVal = [[NSString alloc]initWithFormat:@"%ld",radio.tag - 3000 ];
}

#pragma mark ZhpickVIewDelegate 下拉选择
-(void)toobarDonBtnHaveClick:(SelectView *)pickView formFieldItem:(FormFieldItem *)item resultString:(NSString *)resultString{
    UITextField *filedView = (UITextField *)[self viewWithTag:pickView.tag + 5000];
    FormField  *formField = [self.formFields objectAtIndex:pickView.tag];
    if (formField.dataType == 4) {
        formField.fieldVal = resultString;
        filedView.text = resultString;
    }else{
        filedView.text = item.itemLabel;
        formField.fieldVal =[[NSString alloc] initWithFormat:@"%ld",item.itemId ];
    }
}


//文本框返回值
-(void)textField:(LXHTextFieldView *)fieldView resultString:(NSString *)resultString{
    FormField  *formField = [self.formFields objectAtIndex:fieldView.tag - 2000];
    formField.fieldVal = resultString;
}



//上传照片
-(void)uploadImages{
    for(int k=0;k<_imageFields.count;k++){
        NSDictionary *imagedic =[_imageFields objectAtIndex:k];
        MessagePhotoView *photoView = [imagedic valueForKey:@"photoView"];
        NSString *fieldI = [imagedic valueForKey:@"fieldI"];
        
        NSMutableArray *imagePaths = [NSMutableArray new];
        
        for(int i=0;i<photoView.photoMenuItems.count;i++){
            UIImage *image = [[photoView.photoMenuItems objectAtIndex:i]valueForKey:@"image"];
            NSData *datas;
            if(UIImagePNGRepresentation(image)==nil){
                datas = UIImageJPEGRepresentation(image, 1.0);
            }else{
                datas = UIImagePNGRepresentation(image);
            }
            NSString *imagePath = [self upload:datas];
            [imagePaths addObject:imagePath];
        }
        FormField  *formField = [self.formFields objectAtIndex:[fieldI integerValue]];
        formField.fieldVal =[imagePaths componentsJoinedByString:@","];
    }
}

-(NSString *)upload:(NSData*) imageData{
    NSData *data=imageData;
    PicOperation *pic = [[PicOperation alloc] init];
    NSDictionary *result = [pic UpLoading:data];
    NSString *path = [result valueForKey:@"filePath"];
    return path;
}

-(BOOL)fileValidate{
    for(int i=0;i<self.formFields.count;i++){
        FormField  *formField = [self.formFields objectAtIndex:i];
        if (formField.required == 1) {
            if (formField.fieldVal==nil || formField.fieldVal.length == 0) {
                [AppUtiles showAlertMessage:[[NSString alloc]initWithFormat:@"请填写：%@",formField.label]];
                return NO;
            }
            
        }
    }
    return YES;
}

@end
