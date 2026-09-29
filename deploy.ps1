# 호치민 여행수첩 자동 배포 스크립트
Set-Location $PSScriptRoot

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git add index.html
$status = git status --porcelain
if (-not $status) {
    Write-Host "변경사항 없음 — 이미 최신 상태입니다." -ForegroundColor Yellow
    exit 0
}
git commit -m "update: $timestamp"
git push origin main
Write-Host ""
Write-Host "✅ 배포 완료! 약 30초 후 아래 URL에 반영됩니다:" -ForegroundColor Green
Write-Host "https://vncjstk10-coder.github.io/hochiminh-trip/" -ForegroundColor Cyan
