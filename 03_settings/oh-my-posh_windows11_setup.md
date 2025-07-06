# Windows Terminal + Oh My Posh 설정 가이드 (Windows 11 기준)

**Oh My Posh**는 터미널 프롬프트를 시각적으로 꾸미고, Git 상태나 시스템 정보 등을 실시간으로 보여주는 강력한 커스터마이징 도구입니다.

---

## ✅ 주요 특징

* 🎨 **다양한 테마**: 내장 테마 또는 사용자 정의 JSON으로 구성 가능
* 📁 **실시간 정보 표시**: Git, 디렉토리, 배터리, 시간 등
* 🔤 **Nerd Font 지원**: 아이콘 및 글리프 표시용
* 💻 **크로스 플랫폼**: PowerShell, Bash, Zsh 등 다양한 셸과 호환

---

## 📦 설치 (Winget)

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

설치 확인:

```powershell
oh-my-posh --version
```

---

## 🎨 Nerd Font 설치

Oh My Posh 테마에는 **Nerd Font**가 필수입니다.

* 추천 폰트: [D2Coding Ligature Nerd Font](https://www.nerdfonts.com/font-downloads)

설치 후, **Windows Terminal → 설정 (Ctrl + ,)** → PowerShell 탭 → `"폰트"` 항목에서 `D2CodingLigature Nerd Font Mono` 등 Nerd Font로 변경

---

## 🚀 기본 적용 (테스트용)

PowerShell에서 다음 명령어 실행:

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
```

프롬프트가 바뀌면 성공.

---

## 🔁 영구 적용 (PowerShell 프로필 설정)

1. PowerShell 프로필 열기:

```powershell
notepad $PROFILE
```

2. 파일이 없다면 먼저 생성:

```powershell
New-Item -Path $PROFILE -ItemType File -Force
notepad $PROFILE
```

3. 아래 라인 추가:

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
```

4. 저장 후 PowerShell 다시 실행

---

## 🎭 테마 선택 및 변경

테마 목록 보기:

```powershell
oh-my-posh get themes
```

다른 테마로 적용 예시:

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression
```

**영구 적용**을 원하면 위 명령어를 `$PROFILE` 파일 내에 넣으면 됨.

---

## 🛠 사용자 정의

Oh My Posh 테마는 모두 JSON 파일로 구성되어 있어, 원하는 세그먼트(예: Git, 시간, 사용자 등)를 직접 편집할 수 있습니다.

테마 위치:

```
C:\Users\YourUser\AppData\Local\Programs\oh-my-posh\themes
```

직접 복사 후 편집해서 새로운 테마를 만들고 `$PROFILE`에서 그 경로를 지정하면 됩니다.

---

## 📚 참고

* 공식 문서: [https://ohmyposh.dev](https://ohmyposh.dev)
* Nerd Font: [https://www.nerdfonts.com/](https://www.nerdfonts.com/)

---
