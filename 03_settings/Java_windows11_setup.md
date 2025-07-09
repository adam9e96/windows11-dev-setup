# Windows 11 Java  설정

## 1. Java JDK 다운로드 및 설치

### 권장 JDK 버전
- **Amazon Corretto**: AWS에서 제공하는 무료 OpenJDK 배포판
- **Oracle JDK**: 상용 라이선스 (개발용은 무료)
- **Eclipse Temurin**: Eclipse Foundation에서 제공

### Amazon Corretto 21 설치
1. [Amazon Corretto 다운로드 페이지](https://aws.amazon.com/corretto/) 방문
2. **Amazon Corretto 21** 선택
3. **Windows x64** MSI 또는 ZIP 파일 다운로드
4. MSI 파일 실행하여 설치 (권장 경로: `C:\Program Files\Amazon Corretto\jdk21.x.x_x`)

## 2. 환경 변수 설정

### 시스템 환경 변수 접근 방법
1. **Windows + R** → `sysdm.cpl` 입력 → Enter
2. 또는 **설정** → **시스템** → **정보** → **고급 시스템 설정**
3. **환경 변수** 버튼 클릭

### JAVA_HOME 설정
**시스템 변수**에 새로 추가:
- **변수 이름**: `JAVA_HOME`
- **변수 값**: `C:\Program Files\Amazon Corretto\jdk21.0.7_6`
  
  > 💡 **주의**: 실제 설치된 경로로 수정하세요

### Path 변수 수정
**시스템 변수**의 `Path` 편집:
1. **Path** 변수 선택 → **편집**
2. **새로 만들기** 클릭
3. `%JAVA_HOME%\bin` 추가
4. **확인** 클릭

## 3. 환경 변수 확인

### 명령 프롬프트(CMD)에서 확인
```cmd
java -version
javac -version
echo %JAVA_HOME%
```

### PowerShell에서 확인
```powershell
java -version
javac -version
$env:JAVA_HOME
echo $env:JAVA_HOME
```

## 4. 정상 설치 결과 예시

### 명령 프롬프트 결과
```cmd
C:\Users\사용자명> java -version
openjdk version "21.0.7" 2025-04-15 LTS
OpenJDK Runtime Environment Corretto-21.0.7.6.1 (build 21.0.7+6-LTS)
OpenJDK 64-Bit Server VM Corretto-21.0.7.6.1 (build 21.0.7+6-LTS, mixed mode, sharing)

C:\Users\사용자명> javac -version
javac 21.0.7

C:\Users\사용자명> echo %JAVA_HOME%
C:\Program Files\Amazon Corretto\jdk21.0.7_6
```

### PowerShell 결과
```powershell
PS C:\Users\사용자명> java -version
openjdk version "21.0.7" 2025-04-15 LTS
OpenJDK Runtime Environment Corretto-21.0.7.6.1 (build 21.0.7+6-LTS)
OpenJDK 64-Bit Server VM Corretto-21.0.7.6.1 (build 21.0.7+6-LTS, mixed mode, sharing)

PS C:\Users\사용자명> javac -version
javac 21.0.7

PS C:\Users\사용자명> $env:JAVA_HOME
C:\Program Files\Amazon Corretto\jdk21.0.7_6
```

## 5. IDE 설정 확인

### IntelliJ IDEA
1. **File** → **Project Structure** → **Project Settings** → **Project**
2. **Project SDK**에서 설치한 JDK 선택

### Visual Studio Code
1. **Extensions**에서 **Extension Pack for Java** 설치
2. **Ctrl+Shift+P** → **Java: Configure Runtime** 실행
3. 설치한 JDK 경로 확인
