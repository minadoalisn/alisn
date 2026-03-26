# 阿里云服务器更新脚本
# 使用方法: powershell -ExecutionPolicy Bypass -File update-server.ps1

$serverIp = "8.138.214.74"
$username = "root"
$password = "Adwnzm2009"
$webRoot = "/usr/share/nginx/html"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  阿里云服务器更新脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "服务器IP: $serverIp" -ForegroundColor Yellow
Write-Host "用户名: $username" -ForegroundColor Yellow
Write-Host "网站目录: $webRoot" -ForegroundColor Yellow
Write-Host ""

# 使用 plink (PuTTY) 连接
$plinkPath = "plink.exe"

# 检查 plink 是否可用
if (Get-Command $plinkPath -ErrorAction SilentlyContinue) {
    Write-Host "使用 plink 连接..." -ForegroundColor Green
    
    # 构建命令
    $command = "cd $webRoot && git pull origin main"
    
    # 使用 plink 执行
    & $plinkPath -pw $password "$username@$serverIp" $command
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "  服务器更新成功！" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Red
        Write-Host "  服务器更新失败！" -ForegroundColor Red
        Write-Host "========================================" -ForegroundColor Red
    }
} else {
    Write-Host "plink 未找到，尝试使用 ssh 命令..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "请手动执行以下命令：" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "ssh $username@$serverIp" -ForegroundColor White
    Write-Host "密码: $password" -ForegroundColor White
    Write-Host ""
    Write-Host "然后执行：" -ForegroundColor Cyan
    Write-Host "cd $webRoot" -ForegroundColor White
    Write-Host "git pull origin main" -ForegroundColor White
}

Write-Host ""
Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
