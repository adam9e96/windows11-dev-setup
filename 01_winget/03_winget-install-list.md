# Windows 소프트웨어 설치 목록 (winget)

## 🔧 개발 도구 / IDE

```powershell
winget install --id=Microsoft.VisualStudioCode.Insiders -e
winget install --id=HeidiSQL.HeidiSQL -e
winget install --id=JetBrains.Toolbox -e
winget install --id=Git.Git -e
winget install --id=Helix.Helix -e
winget install --id=Postman.Postman -e
winget install --id=GitHub.GitHubDesktop -e
```

## 📦 패키지 / 프레임워크

```powershell
winget install --id=Microsoft.DotNet.SDK.9 -e
winget install --id=Microsoft.DotNet.SDK.8 -e
winget install --id=Microsoft.UI.Xaml.2.8 -e
winget install --id=Python.Python.3.13 -e
```

## 💻 터미널 / 셸

```powershell
winget install --id=Microsoft.PowerShell.Preview -e
winget install --id=Microsoft.WindowsTerminal.Preview -e
```

## 📚 문서 / 노트 / PDF

```powershell
winget install --id=Notion.Notion -e
winget install --id=Obsidian.Obsidian -e
winget install --id=Notepad++.Notepad++ -e
winget install --id=SumatraPDF.SumatraPDF -e
```

## 🧠 AI / 생산성

```powershell
winget install --id=Anthropic.Claude -e
```

## 🌐 브라우저

```powershell
winget install --id=Mozilla.Firefox.DeveloperEdition.ko -e
```

## 📁 압축 / 다운로드 / P2P

```powershell
winget install --id=7zip.7zip -e
winget install --id=M2Team.NanaZip.Preview  -e
winget install --id=Tonec.InternetDownloadManager -e
winget install --id=qBittorrent.qBittorrent -e
```

## 🎞️ 미디어 도구

```powershell
winget install --id=Gyan.FFmpeg -e
winget install --id=yt-dlp.yt-dlp -e
winget install --id=DuongDieuPhap.ImageGlass -e
```

## 🧰 시스템 도구 / 유틸리티

```powershell
winget install --id=Henry++.MemReduct -e
winget install --id=WiresharkFoundation.Wireshark -e
winget install --id=voidtools.Everything -e
winget install --id=MartiCliment.UniGetUI.Pre-Release -e
winget install --id=CrystalDewWorld.CrystalDiskInfo -e
```

## 🧩 Microsoft Visual C++ Redistributable

```powershell
winget install --id=Microsoft.VCRedist.2015+.x64 -e
winget install --id=Microsoft.VCRedist.2015+.x86 -e
winget install --id=Microsoft.VCRedist.2013.x64 -e
winget install --id=Microsoft.VCRedist.2013.x86 -e
winget install --id=Microsoft.VCRedist.2010.x64 -e
winget install --id=Microsoft.VCRedist.2010.x86 -e
```

## 📋 유용한 winget 명령어

```powershell
# 설치된 프로그램 목록 보기
winget list

# 프로그램 검색
winget search [프로그램명]

# 프로그램 업데이트
winget upgrade [패키지ID]

# 모든 프로그램 업데이트
winget upgrade --all

# 프로그램 제거
winget uninstall [패키지ID]
```