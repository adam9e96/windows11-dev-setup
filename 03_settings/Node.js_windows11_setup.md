# fnm으로 Node.js 설치 및 사용 가이드

## 📋 개요

fnm(Fast Node Manager)은 Node.js 버전을 깔끔하게 관리할 수 있는 도구
- **시스템 깨끗함**: 레지스트리, 서비스, 스케줄러 생성 안함
- **AppData만 사용**: 완전 제거 시 폴더 삭제만으로 OK
- **빠른 버전 전환**: 프로젝트별 Node.js 버전 자동 관리

---

## 🚀 1. fnm 설치

### Windows에서 설치
```powershell
# winget으로 설치 (추천)
winget install Schniz.fnm
```

### 설치 확인
```powershell
fnm --version
```

### ⚠️ **중요: PowerShell 환경 설정 (필수)**

fnm 설치 후 PowerShell에서 사용하려면 환경 설정이 필요

#### 즉시 사용 (현재 세션용)
```powershell
# PowerShell에서 fnm 환경 활성화
fnm env | Out-String | Invoke-Expression
```

#### 영구 설정 (추천)
```powershell
# 1. PowerShell 프로필 생성/확인
if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -Type File -Force }

# 2. 프로필 편집
notepad $PROFILE
```

메모장에서 다음 라인 추가하고 저장:
```powershell
# fnm 환경 설정 (자동 디렉토리 전환 포함)
fnm env --use-on-cd | Out-String | Invoke-Expression
```

#### 설정 적용
```powershell
# 프로필 다시 로드
. $PROFILE

# 또는 PowerShell 완전 재시작
```

---

## 📦 2. Node.js 버전 설치

### 사용 가능한 버전 확인
```powershell
# 설치 가능한 모든 버전 보기
fnm list-remote

# LTS 버전만 보기
fnm list-remote --lts
```

### Node.js 설치
```powershell
# 특정 버전 설치
fnm install 18.19.0
fnm install 20.11.0

# 최신 LTS 설치
fnm install --lts

# 최신 버전 설치
fnm install latest
```

### 설치된 버전 확인
```powershell
fnm list
```

### ✅ **설치 후 즉시 확인**
```powershell
# Node.js와 npm이 제대로 인식되는지 확인
node --version
npm --version

```

---

## 🔄 3. Node.js 버전 사용/전환

### 기본 버전 설정
```powershell
# 전역 기본 버전 설정
fnm default 18.19.0
```

### 임시 버전 전환
```powershell
# 현재 세션에서만 버전 변경
fnm use 20.11.0

# 버전 확인
node --version
npm --version
```

---

## 📁 4. 프로젝트별 버전 관리

### .nvmrc 파일 생성
프로젝트 루트에 `.nvmrc` 파일 생성:
```
18.19.0
```

### 자동 버전 전환
```powershell
# 프로젝트 디렉토리에서
fnm use

# .nvmrc 파일의 버전으로 자동 전환됨
# 단, PowerShell 환경이 제대로 설정되어 있어야 함
```

### 🎯 **디렉토리 자동 전환 (추천 설정)**
PowerShell 프로필에 `--use-on-cd` 옵션을 추가하면 디렉토리 이동 시 자동으로 .nvmrc 버전으로 전환됩니다:

```powershell
# PowerShell 프로필 ($PROFILE)에 이미 추가되어 있어야 함
fnm env --use-on-cd | Out-String | Invoke-Expression
```

이 설정이 있으면:
```powershell
# 프로젝트 디렉토리로 이동만 해도 자동 전환
cd my-project
# Using Node.js v18.19.0 (found in .nvmrc)
```

---

## 🗂️ 5. 파일 위치 및 구조

### fnm이 사용하는 디렉토리
```
%LOCALAPPDATA%\fnm_multishells\
├── node-v18.19.0-win-x64\     # Node.js 18.19.0
├── node-v20.11.0-win-x64\     # Node.js 20.11.0
├── default                     # 기본 버전 심볼릭 링크
└── .fnmrc                     # fnm 설정
```

### npm 글로벌 패키지 위치
```
%APPDATA%\npm\                  # npm 글로벌 패키지
%APPDATA%\npm-cache\           # npm 캐시
```

---

## 🧹 6. 관리 및 삭제

### 특정 Node.js 버전 삭제
```powershell
fnm uninstall 18.19.0
```

### npm 캐시 정리
```powershell
npm cache clean --force
```

### fnm 완전 제거
```powershell
# 1. fnm 제거
winget uninstall Schniz.fnm

# 2. 남은 폴더 삭제
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\fnm_multishells"
Remove-Item -Recurse -Force "$env:APPDATA\npm"
```

---

## 🔧 7. 유용한 명령어

### 상태 확인
```powershell
# 현재 사용 중인 버전
fnm current

# 설치된 모든 버전
fnm list

# 환경 정보
fnm env
```

### 빠른 설치 스크립트
```powershell
# LTS 설치하고 기본으로 설정
fnm install --lts
fnm default lts-latest
```

---

## ⚠️ 8. 트러블슈팅

### 🔥 **"node/npm을 인식할 수 없습니다" 오류 (가장 흔한 문제)**

#### 증상
```powershell
╰─ node --version
node: The term 'node' is not recognized as a name of a cmdlet, function, script file, or executable program.

╰─ fnm use 22.17.0
error: We can't find the necessary environment variables to replace the Node version.
```

#### 해결방법
```powershell
# 1. 즉시 해결 (현재 세션용)
fnm env | Out-String | Invoke-Expression

# 2. 영구 해결 - PowerShell 프로필에 추가
if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -Type File -Force }
notepad $PROFILE

# 프로필에 이 라인 추가:
# fnm env --use-on-cd | Out-String | Invoke-Expression

# 3. 프로필 다시 로드
. $PROFILE
```

### "fnm을 인식할 수 없습니다" 오류
```powershell
# PowerShell 재시작 또는 환경변수 새로고침
refreshenv

# PATH 수동 확인
$env:PATH -split ';' | Where-Object { $_ -like "*fnm*" }

# fnm 재설치
winget uninstall Schniz.fnm
winget install Schniz.fnm
```

### npm 권한 오류
```powershell
# npm 글로벌 디렉토리 변경
npm config set prefix "$env:LOCALAPPDATA\npm-global"
```

### 특정 프로젝트에서 Node.js 인식 안됨
```powershell
# 현재 디렉토리에서 fnm 활성화
fnm use

# .nvmrc 파일이 있다면
fnm install  # .nvmrc 버전 설치
fnm use      # .nvmrc 버전 사용
```

### PATH 수동 설정 (최후 수단)
```powershell
# 현재 PATH에 수동으로 fnm 추가
$env:PATH = "$env:LOCALAPPDATA\fnm;$env:PATH"

# 또는 Node.js 경로 직접 추가
$env:PATH = "C:\Users\adam\AppData\Roaming\fnm\node-versions\v22.17.0;$env:PATH"
```

---

## 📝 9. 실무 권장 워크플로우

### 새 프로젝트 시작 시
```powershell
# 1. 프로젝트 폴더 생성
mkdir my-project
cd my-project

# 2. Node.js 버전 지정
echo "18.19.0" > .nvmrc

# 3. 해당 버전 설치 및 사용
fnm install
fnm use

# 4. package.json 생성
npm init -y
```

### 기존 프로젝트 작업 시
```powershell
# 1. 프로젝트 이동
cd existing-project

# 2. .nvmrc 기반 버전 사용
fnm use

# 3. 의존성 설치
npm install
```

---

## 🎯 결론

fnm은 시스템을 깨끗하게 유지하면서도 Node.js 버전 관리를 효율적으로 할 수 있는 최적의 도구입니다. 레지스트리나 시스템 서비스를 건드리지 않아 포터블한 개발 환경 구축에 적합.