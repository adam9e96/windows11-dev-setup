#Requires -RunAsAdministrator

<#
.SYNOPSIS
  활성화된 네트워크 어댑터의 DNS 서버 설정을 변경합니다.

.DESCRIPTION
  이 스크립트는 현재 IP 및 DNS 설정을 표시한 후, 메뉴를 통해 주요 공용 DNS 제공업체(Google, Cloudflare, AdGuard)로 변경하거나
  DHCP 서버에서 자동으로 주소를 할당하도록 설정을 초기화하는 기능을 제공합니다.
  활성화된 물리적 네트워크 어댑터(이더넷 및 Wi-Fi)를 자동으로 감지하여 변경 사항을 적용하고 결과를 확인합니다.
  스크립트를 실행하려면 관리자 권한이 필요합니다.

.NOTES
  작성자: Gemini
  버전: 1.2
  - 스크립트 내용 한글화
  - 함수 및 파일 이름 변경 (PowerShell 작명 규칙 권장)
#>

# --- 네트워크 정보 표시 헬퍼 함수 ---
function Show-NetworkConfiguration {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Title
    )
    Write-Host "`n$($Title)" -ForegroundColor White
    Write-Host ("-" * $Title.Length) -ForegroundColor White
    $activeAdapters = Get-NetAdapter -Physical | Where-Object { $_.Status -eq 'Up' }
    if (-not $activeAdapters) {
        Write-Warning "활성화된 네트워크 어댑터(유선랜 또는 WiFi)를 찾을 수 없습니다."
        return
    }

    foreach ($adapter in $activeAdapters) {
        $ipConfig = Get-NetIPConfiguration -InterfaceAlias $adapter.Name
        $dnsServers = (Get-DnsClientServerAddress -InterfaceAlias $adapter.Name -AddressFamily IPv4).ServerAddresses

        Write-Host "  어댑터: $($adapter.Name)" -ForegroundColor Yellow
        $ipConfig.IPv4Address.IPAddress | ForEach-Object {
            Write-Host "    - IPv4 주소: $_"
        }
        if ($dnsServers) {
            $dnsServers | ForEach-Object {
                Write-Host "    - DNS 서버: $_"
            }
        } else {
            Write-Host "    - DNS 서버: (자동으로 할당됨)"
        }
    }
    Write-Host
}

# --- 메인 함수 ---
function Set-DnsServer {
    # --- DNS 제공업체 정보 ---
    $dnsProviders = @{
        "Google"     = @("8.8.8.8", "8.8.4.4");
        "Cloudflare" = @("1.1.1.1", "1.0.0.1");
        "AdGuard"    = @("94.140.14.14", "94.140.15.15");
    }

    # --- 스크립트 메인 로직 ---
    Clear-Host

    # 1. 관리자 권한 확인
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Warning "이 스크립트를 실행하려면 관리자 권한이 필요합니다."
        Write-Warning "PowerShell을 '관리자 권한으로 실행'한 후 다시 시도해주세요."
        Read-Host "엔터 키를 눌러 종료하세요..."
        return
    }
    
    # 2. 현재 네트워크 구성 표시
    Show-NetworkConfiguration -Title "현재 네트워크 설정"

    # 3. 메뉴 표시
    Write-Host "=========================================" -ForegroundColor Cyan
    Write-Host "  DNS 서버 변경 스크립트" -ForegroundColor White
    Write-Host "=========================================" -ForegroundColor Cyan
    Write-Host
    $i = 1
    foreach ($provider in $dnsProviders.Keys) {
        Write-Host "  $i. $($provider) DNS 로 변경" -ForegroundColor Green
        $i++
    }
    Write-Host "  R. DNS 설정 초기화 (DHCP 자동 할당)" -ForegroundColor Yellow
    Write-Host "  Q. 종료" -ForegroundColor Red
    Write-Host

    # 4. 사용자 선택
    $choice = Read-Host "원하는 작업을 선택하세요"

    # 5. 활성화된 네트워크 어댑터 찾기
    $activeAdapters = Get-NetAdapter -Physical | Where-Object { $_.Status -eq 'Up' }
    if (-not $activeAdapters) {
        Write-Error "활성화된 네트워크 어댑터(유선랜 또는 WiFi)를 찾을 수 없습니다."
        Read-Host "엔터 키를 눌러 종료하세요..."
        return
    }

    # 6. 선택 처리
    $selectedProviderName = $null
    $selectedDnsServers = $null

    switch ($choice) {
        "1" { $selectedProviderName = "Google";     $selectedDnsServers = $dnsProviders.Google }
        "2" { $selectedProviderName = "Cloudflare"; $selectedDnsServers = $dnsProviders.Cloudflare }
        "3" { $selectedProviderName = "AdGuard";    $selectedDnsServers = $dnsProviders.AdGuard }
        "R" { # DHCP로 초기화
        }
        "Q" { Write-Host "스크립트를 종료합니다."; return }
        default {
            Write-Error "잘못된 선택입니다. 스크립트를 다시 실행해주세요."
            Read-Host "엔터 키를 눌러 종료하세요..."
            return
        }
    }

    # 7. DNS 설정 적용
    try {
        foreach ($adapter in $activeAdapters) {
            $adapterName = $adapter.Name
            if ($choice -eq 'R') {
                Write-Host "`n'$($adapterName)' 어댑터의 DNS 설정을 초기화합니다 (DHCP)..." -ForegroundColor Yellow
                Set-DnsClientServerAddress -InterfaceAlias $adapterName -ResetServerAddresses -Confirm:$false
            } else {
                Write-Host "`n'$($adapterName)' 어댑터의 DNS를 '$($selectedProviderName)' 로 설정합니다..." -ForegroundColor Green
                Write-Host "  - 기본 DNS: $($selectedDnsServers[0])"
                Write-Host "  - 보조 DNS: $($selectedDnsServers[1])"
                Set-DnsClientServerAddress -InterfaceAlias $adapterName -ServerAddresses $selectedDnsServers -Confirm:$false
            }
        }

        Write-Host "`nDNS 캐시를 초기화합니다..." -ForegroundColor Cyan
        ipconfig /flushdns | Out-Null

        Write-Host "`n[성공] DNS 설정이 완료되었습니다." -ForegroundColor White
        
        # 8. 변경된 네트워크 구성 표시
        Show-NetworkConfiguration -Title "변경된 네트워크 설정"

    }
    catch {
        Write-Error "DNS 설정 중 오류가 발생했습니다: $($_.Exception.Message)"
    }
    finally {
        Read-Host "엔터 키를 눌러 종료하세요..."
    }
}

# 함수 실행
Set-DnsServer