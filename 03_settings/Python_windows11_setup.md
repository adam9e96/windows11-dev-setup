# uv로 Python 개발환경 구축 가이드

## 📋 개요

uv는 Rust로 작성된 **극도로 빠른** Python 패키지 및 프로젝트 관리자.
- **통합 도구**: Python 버전 관리 + 패키지 관리 + 가상환경 + 프로젝트 관리
- **압도적 속도**: 기존 pip보다 10-100배 빠름
- **시스템 깨끗함**: 레지스트리, 서비스 건드리지 않음 (AppData만 사용)
- **현대적 설계**: pyproject.toml 기반, Lock 파일 지원
- **PyCharm 지원**: 2024.3.2+ 버전에서 GUI 지원

---

## 🚀 1. uv 설치

### Windows에서 설치
```powershell
# winget으로 설치 (추천)
winget install astral-sh.uv

# 또는 PowerShell 스크립트로
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### 설치 확인
```powershell
uv --version
# uv 0.5.1 (또는 최신 버전)
```

### ⚠️ **환경변수 설정 (자동)**
uv는 설치 시 자동으로 PATH에 추가되므로 별도 설정이 불필요.

---

## 🐍 2. Python 버전 관리

### 사용 가능한 Python 버전 확인
```powershell
# 설치 가능한 모든 Python 버전 보기
uv python list --all-versions

# 현재 설치된 Python 버전들
uv python list
```

### Python 설치
```powershell
# 특정 버전 설치
uv python install 3.11.7
uv python install 3.12.1

# 최신 버전 설치
uv python install 3.12
```

### Python 버전 사용
```powershell
# 특정 버전으로 스크립트 실행
uv run --python 3.11 python script.py

# 시스템 Python과 독립적으로 실행
uv run --python 3.12 python -c "import sys; print(sys.version)"
```

---

## 📦 3. 새 프로젝트 생성

### 기본 프로젝트 생성
```powershell
# 새 프로젝트 생성
uv init my-project
cd my-project

# 생성되는 구조 확인
tree /f
```

### 특정 Python 버전으로 프로젝트 생성
```powershell
# Python 3.11로 프로젝트 생성
uv init --python 3.11 my-project

# 라이브러리 프로젝트 생성
uv init --lib my-library
```

### 프로젝트 구조
```
my-project/
├── .python-version      # 프로젝트 Python 버전
├── pyproject.toml       # 프로젝트 설정 및 의존성
├── README.md
├── src/
│   └── my_project/
│       └── __init__.py
└── .venv/              # 가상환경 (자동 생성)
```

---

## 📚 4. 패키지 관리

### 의존성 추가
```powershell
# 패키지 설치
uv add requests
uv add pandas numpy

# 버전 지정 설치
uv add "fastapi>=0.100.0,<1.0.0"

# 개발 의존성 추가
uv add --dev pytest black flake8

# Git 의존성 추가
uv add git+https://github.com/user/repo.git
```

### 의존성 제거
```powershell
uv remove requests
uv remove --dev pytest
```

### 의존성 업그레이드
```powershell
# 모든 패키지 업그레이드
uv lock --upgrade

# 특정 패키지만 업그레이드
uv lock --upgrade-package requests
```

---

## 🏃‍♂️ 5. 프로젝트 실행

### 스크립트 실행
```powershell
# 프로젝트 환경에서 실행
uv run python main.py
uv run python -m pytest

# 설치된 명령어 실행
uv run black .
uv run pytest
```

### 대화형 Python
```powershell
# 프로젝트 환경에서 Python REPL
uv run python

# IPython 사용 (설치되어 있다면)
uv run ipython
```

### 일회성 실행 (임시 환경)
```powershell
# 임시 환경에서 패키지와 함께 실행
uv run --with requests python -c "import requests; print(requests.get('https://httpbin.org/get').json())"

# 여러 패키지와 함께
uv run --with pandas --with matplotlib python analysis.py
```

---

## 🔄 6. 기존 프로젝트 작업

### 프로젝트 동기화
```powershell
# Git에서 클론 후
git clone https://github.com/user/project.git
cd project

# 의존성 동기화 (lock 파일 기반)
uv sync

# 개발 의존성 포함 동기화
uv sync --dev
```

### requirements.txt에서 마이그레이션
```powershell
# requirements.txt의 모든 패키지 추가
uv add -r requirements.txt

# requirements-dev.txt의 개발 의존성 추가
uv add --dev -r requirements-dev.txt
```

---

## 🎨 7. PyCharm 연동

### 새 프로젝트에서 uv 사용
1. **File** → **New Project**
2. **Environment Type**에서 **uv** 선택
3. **Python Version** 자동 선택됨
4. **Create** 클릭

### 기존 프로젝트에 uv 설정
1. **File** → **Settings** (Ctrl+Alt+S)
2. **Project** → **Python Interpreter**
3. **Add Interpreter** → **Add Local Interpreter**
4. **Environment Type**: **uv** 선택
5. **OK** 클릭

### PyCharm에서 패키지 설치
```powershell
# PyCharm Terminal 탭에서
uv add requests fastapi

# 또는 Run 설정에서 uv run 사용
```

---

## 🗂️ 8. 파일 위치 및 구조

### uv가 사용하는 디렉토리
```
# Windows 기준
%LOCALAPPDATA%\uv\
├── cache/                  # 패키지 캐시
├── python/                 # 설치된 Python 버전들
│   ├── cpython-3.11.7-windows-x86_64/
│   └── cpython-3.12.1-windows-x86_64/
└── tools/                  # uv 도구들

# 프로젝트별
my-project/
├── .venv/                  # 프로젝트 가상환경
├── uv.lock                 # 정확한 버전 잠금
└── pyproject.toml          # 프로젝트 설정
```

### pyproject.toml 예시
```toml
[project]
name = "my-project"
version = "0.1.0"
description = "My awesome project"
dependencies = [
    "requests>=2.31.0",
    "fastapi>=0.100.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "black>=23.0.0",
    "flake8>=6.0.0",
]

[tool.uv]
dev-dependencies = [
    "pytest>=7.0.0",
    "black>=23.0.0",
]
```

---

## 🧹 9. 관리 및 삭제

### 캐시 정리
```powershell
# 패키지 캐시 정리
uv cache clean

# 특정 패키지 캐시만 정리
uv cache clean requests
```

### Python 버전 제거
```powershell
# 설치된 Python 버전 제거
uv python uninstall 3.11.7
```

### uv 완전 제거
```powershell
# 1. uv 제거
winget uninstall astral-sh.uv

# 2. 남은 폴더 삭제
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\uv"

# 3. 프로젝트별 .venv 폴더 삭제 (선택사항)
Remove-Item -Recurse -Force ".venv"
```

---

## ⚠️ 10. 트러블슈팅

### "uv를 인식할 수 없습니다" 오류
```powershell
# PATH 확인
$env:PATH -split ';' | Where-Object { $_ -like "*uv*" }

# uv 재설치
winget uninstall astral-sh.uv
winget install astral-sh.uv

# PowerShell 재시작
```

### Python 버전 충돌
```powershell
# 현재 사용 중인 Python 확인
uv run python --version

# 특정 버전 강제 사용
uv run --python 3.11 python script.py

# .python-version 파일 확인
cat .python-version
```

### 의존성 해결 실패
```powershell
# 캐시 정리 후 재시도
uv cache clean
uv sync

# Lock 파일 재생성
Remove-Item uv.lock
uv lock
```

### PyCharm에서 uv 인식 안됨
- **PyCharm 2024.3.2 이상** 사용 확인
- **Settings** → **Project** → **Python Interpreter** → **Add Interpreter** → **uv** 선택
- uv PATH 수동 지정: `%LOCALAPPDATA%\Microsoft\WinGet\Packages\astral-sh.uv_Microsoft.Winget.Source_8wekyb3d8bbwe\uv.exe`

### 가상환경 문제
```powershell
# .venv 삭제 후 재생성
Remove-Item -Recurse -Force .venv
uv sync
```

---

## 📝 11. 실무 권장 워크플로우

### 새 프로젝트 시작
```powershell
# 1. 프로젝트 생성
uv init --python 3.12 my-fastapi-app
cd my-fastapi-app

# 2. 필요한 패키지 추가
uv add fastapi uvicorn

# 3. 개발 도구 추가
uv add --dev pytest black flake8 mypy

# 4. 첫 실행
uv run python src/my_fastapi_app/__init__.py
```

### 기존 프로젝트 참여
```powershell
# 1. 프로젝트 클론
git clone https://github.com/team/project.git
cd project

# 2. 환경 동기화
uv sync --dev

# 3. 실행 확인
uv run python main.py
```

### 배포 준비
```powershell
# 1. 의존성 정리 및 업데이트
uv lock --upgrade

# 2. 테스트 실행
uv run pytest

# 3. 코드 포맷팅
uv run black .
uv run flake8 .

# 4. 빌드 (라이브러리인 경우)
uv build
```

### 일상적인 개발
```powershell
# 새 패키지 필요시
uv add scikit-learn

# 스크립트 실행
uv run python analysis.py

# 테스트 실행
uv run pytest tests/

# 대화형 개발
uv run ipython
```

---

## 🔄 12. 기존 도구와 비교

### 속도 비교
| 작업 | pip + venv | conda | poetry | uv |
|------|------------|-------|--------|-----|
| **환경 생성** | 30초 | 60초 | 20초 | **3초** |
| **패키지 설치** | 60초 | 90초 | 30초 | **5초** |
| **의존성 해결** | 120초 | 180초 | 45초 | **8초** |

### 기능 비교
| 기능 | pip | conda | poetry | uv |
|------|-----|-------|--------|-----|
| **패키지 관리** | ✅ | ✅ | ✅ | ✅ |
| **가상환경** | venv 별도 | ✅ | ✅ | ✅ |
| **Python 버전 관리** | ❌ | ✅ | ❌ | ✅ |
| **Lock 파일** | ❌ | ✅ | ✅ | ✅ |
| **속도** | ⭐⭐ | ⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **모던 설계** | ❌ | ❌ | ✅ | ✅ |

### 마이그레이션 가이드
```powershell
# From pip + venv
pip freeze > requirements.txt
uv init --python 3.12
uv add -r requirements.txt

# From poetry
uv init
# pyproject.toml을 uv 형식으로 수동 변환 필요

# From conda
conda list --export > conda-requirements.txt
uv init --python 3.12
# 수동으로 패키지 추가
```

---

## 🎯 결론

uv는 Python 개발의 **새로운 표준**이 될 도구입니다. 압도적인 속도와 통합된 기능으로 개발 생산성을 크게 향상시킬 수 있습니다.

### 🔑 **핵심 장점**
1. **10-100배 빠른 속도**: 기다리는 시간 최소화
2. **통합 환경**: Python 버전 + 패키지 + 가상환경 + 프로젝트 관리
3. **현대적 설계**: pyproject.toml, Lock 파일로 재현 가능한 환경
4. **시스템 깨끗함**: 포터블 설치, 쉬운 제거
5. **PyCharm 지원**: IDE에서 GUI로 편리한 사용

### ⚡ **빠른 시작 체크리스트**
```powershell
# 1. uv 설치
winget install astral-sh.uv

# 2. 새 프로젝트 생성
uv init --python 3.12 my-project
cd my-project

# 3. 패키지 추가
uv add requests fastapi

# 4. 실행
uv run python main.py
```

### 🚀 **다음 단계**
- 기존 프로젝트를 uv로 점진적 마이그레이션
- PyCharm에서 uv 인터프리터 설정
- 팀 개발 시 uv.lock 파일로 환경 통일

**uv는 Python 개발의 미래입니다. 지금 시작하세요!**