# -*- coding: utf-8 -*-
"""
百度搜索资源平台主动推送脚本
自动推送网站所有页面到百度，加速收录
"""

import requests
import json

# ================== 配置信息 ==================
# 百度搜索资源平台 token（从用户获取）
BAIDU_TOKEN = "80e45d920116df0d1314378f0bf4b224"

# 网站地址
SITE_URL = "http://8.138.214.74"

# 要推送的页面列表
URLS_TO_PUSH = [
    f"{SITE_URL}/",
    f"{SITE_URL}/index.html",
    f"{SITE_URL}/about.html",
    f"{SITE_URL}/services.html",
    f"{SITE_URL}/cases.html",
    f"{SITE_URL}/sitemap.xml",
]

# 百度推送接口地址
PUSH_API = f"http://data.zz.baidu.com/urls?site={SITE_URL}&token={BAIDU_TOKEN}"

# ================== 推送函数 ==================
def push_urls(urls):
    """
    推送URL列表到百度
    """
    headers = {
        'Content-Type': 'text/plain',
    }
    
    # 将URL列表转换为文本格式（每行一个URL）
    data = '\n'.join(urls)
    
    try:
        print(f"正在推送 {len(urls)} 个URL到百度...")
        print(f"推送接口: {PUSH_API}")
        print(f"推送URLs:\n{data}")
        print("-" * 50)
        
        response = requests.post(PUSH_API, headers=headers, data=data, timeout=30)
        
        print(f"响应状态码: {response.status_code}")
        print(f"响应内容: {response.text}")
        
        result = response.json()
        
        if 'success' in result:
            print(f"✅ 成功推送 {result['success']} 个URL")
        if 'remain' in result:
            print(f"📊 今日剩余推送次数: {result['remain']}")
        if 'error' in result:
            print(f"❌ 错误: {result['error']}")
        if 'message' in result:
            print(f"📝 消息: {result['message']}")
            
        return result
        
    except requests.exceptions.RequestException as e:
        print(f"❌ 推送失败: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"❌ 解析响应失败: {e}")
        print(f"响应内容: {response.text}")
        return None

# ================== 主函数 ==================
if __name__ == "__main__":
    print("=" * 50)
    print("百度搜索资源平台主动推送脚本")
    print("=" * 50)
    print()
    
    # 执行推送
    result = push_urls(URLS_TO_PUSH)
    
    print()
    print("=" * 50)
    if result and 'success' in result:
        print("✅ 推送完成！")
    else:
        print("⚠️  推送完成，请检查上面的输出")
    print("=" * 50)
