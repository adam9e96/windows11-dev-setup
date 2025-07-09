# Windows 11에서 WSL & Fedora Linux 42 설치 가이드

## 1. WSL 설치

### 1.1 기본 WSL 설치
PowerShell을 관리자 권한으로 실행한 후:

```powershell
wsl --install
```

### 1.2 Fedora Linux 42 설치
```powershell
wsl --install FedoraLinux-42
```

### 1.3 WSL 설치가 안되는 경우 해결방법

**Windows 기능 활성화 (재부팅 필요)**
1. `Win + R` → `appwiz.cpl` 실행
2. 좌측 **"Windows 기능 켜기/끄기"** 클릭
3. 다음 항목들을 체크:
   - ✅ **Linux용 Windows 하위 시스템**
   - ✅ **Virtual Machine Platform**
4. **확인** 후 시스템 재부팅

재부팅 후 다시 Fedora 설치:
```powershell
wsl --install FedoraLinux-42
```

## 2. Fedora 초기 설정

### 2.1 사용자 계정 생성
설치 완료 후 다음과 같이 사용자 계정을 생성합니다:

```
Please create a default user account. The username does not need to match your Windows username.
Enter new UNIX username: adam9e96
```

### 2.2 WSL 실행
```powershell
wsl.exe -d FedoraLinux-42
```

## 3. 시스템 업데이트 및 패키지 관리

### 3.1 시스템 업데이트
```bash
sudo dnf update
```

### 3.2 기본 패키지 설치

**시스템 모니터링 도구**
```bash
sudo dnf install htop
```

**시스템 정보 도구**
```bash
sudo dnf install fastfetch
```

**파일 관리자**
```bash
sudo dnf install nautilus
sudo dnf install mesa-libGLES
```

### 3.3 패키지 삭제 방법
```bash
sudo dnf remove [패키지명]
# 예시: sudo dnf remove gedit
```

## 4. 개발 도구 설치

### 4.1 기본 개발 도구
```bash
sudo dnf install curl unzip zip
```

### 4.2 SDKMAN 설치

**SDKMAN 다운로드 및 설치**
```bash
curl -s "https://get.sdkman.io" | bash
```

**SDKMAN 환경 설정**
```bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

**설치 확인**
```bash
sdk version
```

성공적으로 설치되면 다음과 같은 출력이 나타납니다:
```
SDKMAN!
script: 5.19.0
native: 0.7.4 (linux x86_64)
```

## 5. 유용한 WSL 명령어

### 5.1 WSL 관리 명령어
```powershell
# WSL 배포판 목록 확인
wsl --list --verbose

# 특정 배포판 실행
wsl -d FedoraLinux-42

# WSL 종료
wsl --shutdown

# 특정 배포판 종료
wsl --terminate FedoraLinux-42
```

### 5.2 사용자 비밀번호 설정
```bash
sudo passwd adam9e96
```

## 💡 참고사항

- Fedora에서는 `dnf`가 기본 패키지 매니저입니다
- 생성된 사용자는 자동으로 `wheel` 그룹에 포함되어 `sudo` 권한을 가집니다
- Windows 파일 시스템은 `/mnt/c/` 경로에서 접근 가능합니다
- SDKMAN을 통해 Java, Kotlin, Gradle 등 다양한 개발 도구를 쉽게 관리할 수 있습니다