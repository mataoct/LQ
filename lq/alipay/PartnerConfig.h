//
//  PartnerConfig.h
//  AlipaySdkDemo
//
//  Created by ChaoGanYing on 13-5-3.
//  Copyright (c) 2013年 RenFei. All rights reserved.
//
//  提示：如何获取安全校验码和合作身份者id
//  1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
//  2.点击“商家服务”(https://b.alipay.com/order/myorder.htm)
//  3.点击“查询合作者身份(pid)”、“查询安全校验码(key)”
//

#ifndef MQPDemo_PartnerConfig_h
#define MQPDemo_PartnerConfig_h

//合作身份者id，以2088开头的16位纯数字
#define PartnerID @"2088511724484349"
//收款支付宝账号
#define SellerID  @"2994833896@qq.com"

//安全校验码（MD5）密钥，以数字和字母组成的32位字符
#define MD5_KEY @"okkcs8za7xeuemhmbpmks2kd7agiqu8e"

//商户私钥，自助生成
#define PartnerPrivKey @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMcFZaiksNQh/q0+90/FDt/kymRTRInODDoL4DzLb7Au21w0gYY+gFZaE8pt6F5bfBimYnB9lTBe0+M/ViyfRYYOvb6sSygcZriv8wmWo8G2WFmfP/m0cnQjyQ57UxCUVjAaJRFaqATK6NI3muuqszfJKKq+WOW8Lr1PQfMEqyBPAgMBAAECgYAk/zzZr9vrY3JrlFP3MUPFnUt+gPgxwesF82U5B/x4PQ2sQ1p8sSu8YbxiGjJjMBCOqIeOL9pHBqnPCdwkKWuL3wLL7oNqMiqBrUdEkcEhON2AocIuirBI1E3dMDtbpKLDBOkz+djbo3vnwxf0m9Vh7wsp5m+OayvieQHLASm+AQJBAPWlm0F9VqIUz6BSq2yDOsq38RC30WjH05JZLmjb1KzOUm0dfau+PnfQuyHO6OPcMaSy0uxVA8s302Fj9iN2T08CQQDPaLlWb2nZ3y7u89rwSO9wSWeVrh8S2e/2pDqiuo/Z3SS6MzO3YoaLFP8BIEy/G30mhH1+kDsQCUP4vwkcMd8BAkAQOtLZLtjMeKeHJi8hSkJWJnUM77gsPheicbX5Q5z3leIoR2yILleePvI+N5d3hpLZGN+KsctAX/3dT2dxzF1NAkEAsadq8O1XhmXTpps7Ugu3A7/sONo/BX+lOearzszsAFmaZt8Kki6TPbhLQGSxOBRMm1xqvai+3lqBXSQMopjZAQJASAjwID3PBvk58khEQLIBYrY72eN2yaQMInsr8zEXzcn9R85GuPgxDb0AHNZU/83XpSaEX7xb9ijlXTFvy8w7ZQ=="

//支付宝公钥
#define AlipayPubKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"


#endif
