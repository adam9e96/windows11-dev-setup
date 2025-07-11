Before
![alt text]({AF1C7895-706A-444A-B422-973240A7B644}.png)

After
![alt text]({47701865-2C6C-4957-8B68-CE0DBA502B76}.png)


# Windows 기능 (제어판 > 프로그램 > Windows 기능 켜기/끄기)
개발 및 가상화에 필수적인 최소한의 기능만 활성화

#### 개발 환경
- **.NET Framework 4.8 Advanced Services** - 레거시 .NET 애플리케이션 지원
- **Linux용 Windows 하위 시스템 (WSL)** - Linux 개발 환경 지원

#### 가상화 및 컨테이너
- **Virtual Machine Platform** - Hyper-V 및 컨테이너 기반 기술 지원

#### 문서 및 인쇄
- **Microsoft PDF로 인쇄** - PDF 생성 기능
- **인쇄 및 문서 서비스** - 고급 인쇄 관리

## 권장 사항

### 현재 구성의 장점
1. **최소한의 기능만 활성화**: 시스템 리소스 절약 및 보안 강화
2. **개발 환경 최적화**: WSL을 통한 Linux 개발 환경 지원
3. **가상화 준비**: Virtual Machine Platform으로 Docker, Hyper-V 사용 가능

### 추가 고려사항 (필요시)
- **Hyper-V** - 완전한 가상화 환경이 필요한 경우
- **Windows 샌드박스** - 격리된 테스트 환경이 필요한 경우
- **Windows Terminal** - 현대적인 터미널 환경 (Microsoft Store에서 설치)

### 최소 구성 이유
- **보안 강화**: 사용하지 않는 레거시 기능 및 Windows 기능 제거로 공격 표면 축소
- **성능 최적화**: 불필요한 서비스 및 기능 제거로 시스템 리소스 절약
- **개발 환경 정리**: 현대적인 개발 도구에 집중, 필수 기능만 활성화
- **시스템 안정성**: 복잡한 기능 의존성 최소화로 시스템 안정성 향상

## 적용 방법

### 선택적 기능 설정
```
설정 > 앱 > 선택적 기능
```

### Windows 기능 설정
```
제어판 > 프로그램 > Windows 기능 켜기/끄기
```
또는
```
Win + R > appwiz.cpl > Windows 기능 켜기/끄기
```

**주의**: Windows 기능 변경 시 시스템 재시작이 필요할 수 있습니다.

---
*최종 업데이트: 2025년 7월*