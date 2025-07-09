# Windows 11에서 FFmpeg 설치 및 설정 가이드

## 1. FFmpeg 설치

```powershell
winget install --id=Gyan.FFmpeg -e
```

## 2. 환경변수 설정

### 2.1 FFmpeg 설치 경로 확인
```
C:\Users\[사용자명]\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-7.1.1-full_build\bin
```

### 2.2 시스템 환경변수 등록

1. **환경 변수 편집창 열기**
   - `Win + S` 키를 눌러 검색창 실행
   - "환경 변수" 검색 후 **"시스템 환경 변수 편집"** 클릭

2. **환경 변수 설정**
   - 하단의 **"환경 변수(N)"** 버튼 클릭
   - **시스템 변수** 또는 **사용자 변수** 섹션에서 **"Path"** 선택
   - **"편집"** 버튼 클릭

3. **새 경로 추가**
   - **"새로 만들기"** 클릭
   - FFmpeg의 `bin` 폴더 경로 붙여넣기
   - **"확인"** → **"확인"** → 창 닫기

## 3. 설치 확인

새로운 PowerShell 또는 Command Prompt 창을 열고 다음 명령어로 설치를 확인

```powershell
ffmpeg -version
```

정상적으로 설치되었다면 FFmpeg 버전 정보가 출력됨