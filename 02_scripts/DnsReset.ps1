Write-Host "🔄 DNS 캐시를 초기화하는 중입니다..." -ForegroundColor Cyan
try {
    ipconfig /flushdns | Out-Null
    Write-Host "✅ DNS 캐시가 성공적으로 초기화되었습니다." -ForegroundColor Green
} catch {
    Write-Host "❌ 오류 발생: $_" -ForegroundColor Red
}
Pause
