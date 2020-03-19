package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101900723923";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCCOqSLuBR2y9lxWXm0tgzOym5+0fTgGMglmHwfwQ9+BWjbnafhDzWY/pOzGoCWaQhT6om3SeIeYx3I5XO/I0CakKLUFsZi12sApULiryd5ERBhr/6WaTKuT4K3tZjeC+cAv31wU10/XQiwv7V6mloPM4xI3lc/PVChpB9trNmcOLSc0czlWaPvZWwtghB+FbdHYf5OMe2qaloR9/53P9bJDL9yS0pe/cN0rPenueA8cBZb3cGHVIZdAkYE8zNHtaIRgCLUeGHN/6Rv3MaKBF2VgqN7tKTdz1bV/QyXD56DyHKRI2VWpslOAEITz56PEtai1EYCKpsE0xJy6dXOLmzTAgMBAAECggEAYLwAyAw3nzqyzUDCZ9qmzuCNjUSWGfQuj8ahxNCammiYSDHmpwWuMXRA8FRqWc+xMOxR2cVW4m2LjVPrU3pzHZz8ZoB4YqlTQUqA0XN75bEoMvgRK1b/H33OQnnxEFdVAzg6jDpQVKXds7TjsCuBZDNNLD+EHWSFRVxtQAGaLzDUAFOHlGj//EVxFBkE4DDB8DO/hBm6gE6r7tx0YFlRuCE46DPMnVUA3gi9/+xAwzf9ZxKY1ZnI8kthwiUMmmWqj5tBqhjfBdxZ2tm04z9heoI/CLTexGcPdsdgclAC1lqWfYB58JR28Gc/i/nyKI3kIbCmSBRJIdHRzqQybs21GQKBgQDq/SJh+vv3MLafzUs1lsuAgTm6Ucve0jztPCcYtPsnmVMA+Tz2pcLHcJPMbFtnvC8y7UihPaECYHf+gWFP2ytD6rJQiEg5JuKXeKAttm4MTb6poyfi2+nc4G3SJ26gTQEgbhRePmQd/9RBNxLiV2hulzgnmHerUqpD/vejsEY6twKBgQCN35IYcXb7ooPLwKHq6PFsyrk38xLbRZ2pLSE9MlwQcw7/kCoSst/m+xz7NKsHZNNEWu5AYX+8O7+Q1AzoNQMfxWnR9DTy6PduZKLixQpGGdJNmhOhkfXHdpE/Fh4iVZDySnvJTfB6Ui7tb3Kk80EvreUvBXhOQKUSdNGqNzCyxQKBgD1DbXlZ8+LIInSbEyaPf9Kq3iADP0GCUjwPWKoKVQhH4un4ELrFEHjqkr3S6imrWCrQzgSripSSDfaeSH6HR0pXn9F7FklAKAcRfcEtNJeklTaowLdWWiwpnrgRa7gDG24XBNxlK7jef7nY3+V+oE1kw1EfYOObk6RSjsFwLX8VAoGACDB6l2ydSKM15mIFNrEhln0ROfiPAxc+pZBUVdr9U3nAyOHCe/fVUtj18E42/SNFyrFRBWhbXjs4sJx87j55IrFbjWICWG84MSgf+uUS1b8R06bsMSxiupPOiIy3SpYT2tiP0qvsELODv/Lp9DmSbrUkAJXZPvMeVDVoEOJErl0CgYAjJm3msr4BXoZFPBlry5aNhb5XaunPCDHQNru9eNzQDjMzhg4HXQ3PeGGzrJ9kejRurq3DWy8JKxO/uDAqogIsqfDgiCzn5o0nHv6u4Gz3p2i2KdjG2hMrKdEwhQ6oGQR6PYs1BjWKC2dLTw3U28IxnUYGmgNWtPCGdIKswIT6DQ==";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr+PUF2zfOkV4N4X+p88Df548xwLuQT9Zsz/R11tvQ4Tz9c2I1ivAhZ1omf1ROek+Dx6Jz4eltjF2soxHCEcUJhDRAkm53fYeXOEfKdwNwKjINOwalfYWUYDGsggRQNa3t+K1FRPmenDns/KcF7naHZORbkRVAl2/hfNltiG3d/aWOzBzcW5qGp1yCTnSL7MGjTpC+6eLo2Fe6M6fin/fn1GNWhiEGnE1isXT+rhALlTnKqMpi1gCWkxgdVzlj8cmo6MW8F/mbwQ1M3KEXivlpNQgz0i9EGj23FVY7+m4JhyPdl+qollvwNNoLiFM4LKJMjOrc6vvHI2hsqvu6G8o7QIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

