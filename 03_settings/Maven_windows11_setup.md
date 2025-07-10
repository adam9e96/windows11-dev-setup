# Windows에서 Apache Maven 설치 및 설정 가이드

## 사전 요구사항

- Java JDK 8 이상이 설치되어 있어야 함
- `JAVA_HOME` 환경변수가 올바르게 설정되어 있어야 함

## 1. Maven 다운로드

1. [Apache Maven 공식 다운로드 페이지](https://maven.apache.org/download.cgi)에 접속
2. **Binary zip archive** 다운로드 (Windows용)
   - 예: `apache-maven-3.9.10-bin.zip`

## 2. Maven 압축 해제

1. 다운로드한 zip 파일을 원하는 위치에 압축 해제
   - 권장 경로: `Z:\SDK\Maven\apache-maven-3.9.10`
   - 또는 `C:\Program Files\Apache\maven\apache-maven-3.9.10`

## 3. 환경변수 설정

### 3.1 시스템 환경변수 설정 방법

1. **시스템 속성** 열기
   - `Win + R` → `sysdm.cpl` 입력 → 엔터
   - 또는 제어판 → 시스템 → 고급 시스템 설정

2. **고급** 탭 → **환경 변수** 클릭

3. **시스템 변수** 섹션에서 새 변수 추가

### 3.2 MAVEN_HOME 설정

- **변수 이름**: `MAVEN_HOME`
- **변수 값**: `Z:\SDK\Maven\apache-maven-3.9.10`

### 3.3 M2_HOME 설정

- **변수 이름**: `M2_HOME`
- **변수 값**: `%MAVEN_HOME%`

### 3.4 Path 변수 수정

1. **시스템 변수**에서 `Path` 선택 → **편집**
2. **새로 만들기** 클릭
3. `%MAVEN_HOME%\bin` 추가

## 4. 설정 확인

### 4.1 새 터미널 세션 시작

설정 후 **새로운** PowerShell 또는 Command Prompt 창을 열어야 환경변수가 적용

### 4.2 Maven 버전 확인

```powershell
mvn -version
```

### 4.3 예상 출력 결과

```
Apache Maven 3.9.10 (5f519b97e944483d878815739f519b2eade0a91d)
Maven home: Z:\SDK\Maven\apache-maven-3.9.10
Java version: 21.0.7, vendor: Amazon.com Inc., runtime: Z:\SDK\JDK\amazon-corretto-21.0.7.6.1-windows-x64-jdk\jdk21.0.7_6
Default locale: ko_KR, platform encoding: UTF-8
OS name: "windows 11", version: "10.0", arch: "amd64", family: "windows"
```

### 4.4 환경변수 확인

**Command Prompt에서:**
```cmd
echo %MAVEN_HOME%
echo %M2_HOME%
```

**PowerShell에서:**
```powershell
$env:MAVEN_HOME
$env:M2_HOME
```

## 참고 링크

- [Apache Maven 공식 문서](https://maven.apache.org/guides/getting-started/)
- [Maven 설치 가이드](https://maven.apache.org/install.html)
- [Maven 환경변수 설정](https://maven.apache.org/configure.html)