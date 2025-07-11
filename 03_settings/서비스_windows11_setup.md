# Windows 11 서비스 최적화 목록

## 개요
시스템 성능 향상과 리소스 절약을 위해 비활성화된 Windows 11 서비스들입니다. 
각 서비스는 **중지됨** 상태이며 **사용 안함**으로 설정되어 있습니다.

⚠️ **주의사항**: 서비스 변경 전 시스템 복원 지점을 생성하고, 필요에 따라 언제든 다시 활성화할 수 있습니다.

## 🔧 비활성화된 서비스 목록

### ActiveX 및 레거시 기술
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `AxInstSV` | ActiveX Installer | Windows에서 ActiveX 컨트롤을 설치하도록 도와주는 서비스 | 보안상 위험하며 현대 웹에서 사용하지 않음 |

### Xbox 게임 관련
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `XboxGipSvc` | Xbox Accessory Management Service | Xbox 액세서리 관리 서비스 | Xbox 컨트롤러 미사용시 불필요 |
| `XblGameSave` | Xbox Live 게임 저장 | Xbox Live 게임 저장 관리 | Xbox 게임 미사용시 불필요 |
| `XboxNetApiSvc` | Xbox Live 네트워킹 서비스 | Xbox Live 네트워크 기능 지원 | Xbox 서비스 미사용시 불필요 |
| `XblAuthManager` | Xbox Live 인증 관리자 | Xbox Live 인증 처리 | Xbox 서비스 미사용시 불필요 |

### 지도 및 위치 서비스
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `MapsBroker` | Downloaded Maps Manager | 다운로드된 지도 관리 | 오프라인 지도 미사용시 불필요 |

### 보안 및 암호화
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `BDESVC` | BitLocker Drive Encryption Service | BitLocker 드라이브 암호화를 관리하고 유지하는 서비스 | BitLocker 미사용시 불필요 |

### 소매 및 데모
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `RetailDemo` | 소매 데모 서비스 | 소매점 데모 모드 지원 | 일반 사용자에게 불필요 |
| `WalletService` | WalletService | 지갑 서비스 기능 | 디지털 지갑 미사용시 불필요 |

### 모니터링 및 원격
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `WpcMonSvc` | 자녀 보호 | 자녀 보호 기능 모니터링 | 자녀 보호 기능 미사용시 불필요 |
| `DiagTrack` | Connected User Experiences and Telemetry | Microsoft에 진단 데이터 전송 - 개인정보 및 성능 최적화 | 원격 측정 비활성화로 프라이버시 보호 |
| `seclogon` | Secondary Logon | 다른 사용자 권한으로 실행 | 단일 사용자 환경에서 불필요 |

### 연결 및 통신
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `PhoneSvc` | Phone Service | 전화 관련 기능 지원 | PC에서 전화 기능 미사용시 불필요 |
| `DoSvc` | Delivery Optimization | Windows 업데이트 배포 최적화 | P2P 업데이트 공유 비활성화 |

### 스마트카드
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `SCardSvr` | Smart Card | 스마트카드 지원 | 스마트카드 미사용시 불필요 |
| `ScDeviceEnum` | Smart Card Device Enumeration Service | 스마트카드 장치 열거 | 스마트카드 미사용시 불필요 |
| `SCPolicySvc` | Smart Card Removal Policy | 스마트카드 제거 정책 | 스마트카드 미사용시 불필요 |

### 인덱싱 및 검색
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `WSearch` | Windows Search | Windows 검색 인덱싱 | Everything 등 대체 검색 도구 사용시 |
| `PimIndexMaintenanceSvc_559b80` | Contact Data_559b80 | Windows의 연락처(주소록) 관련 데이터 통기화 및 저장된 관련된 서비스 | 연락처 동기화 미사용시 불필요 |
| `PimIndexMaintenanceSvc_7230e` | PimIndexMaintenanceSvc_7230e | 개인정보 관리 인덱스 유지관리 | 개인정보 인덱싱 미사용시 불필요 |

### 프린터 관련
| 서비스명 | 이름 | 설명 | 비활성화 이유 |
|---------|------|------|---------------|
| `Spooler` | Print Spooler | 프린터 임시 저장 큐 관리 (보안상으로도 취함) | 프린터 미사용시 불필요, 보안상 위험 |