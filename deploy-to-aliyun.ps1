# 阿里云服务器一键更新脚本
# 开心的专属部署脚本
# 使用方法: powershell -ExecutionPolicy Bypass -File deploy-to-aliyun.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  阿里云服务器一键更新" -ForegroundColor Cyan
Write-Host "  开心的专属部署脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$serverIp = "8.138.214.74"
$username = "root"
$privateKey = "C:\Users\35810\.ssh\ailison_rsa"
$webRoot = "/usr/share/nginx/html"

Write-Host "服务器IP: $serverIp" -ForegroundColor Yellow
Write-Host "用户名: $username" -ForegroundColor Yellow
Write-Host "网站目录: $webRoot" -ForegroundColor Yellow
Write-Host ""

Write-Host "正在连接服务器并更新..." -ForegroundColor Green
Write-Host ""

# 执行git pull
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i $privateKey "$username@$serverIp" "cd $webRoot && git pull origin main"

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

Write-Host ""
Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
