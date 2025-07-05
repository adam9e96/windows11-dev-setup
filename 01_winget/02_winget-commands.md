# winget 명령어

---

## 기본 명령어 구조

```
winget [명령어] [옵션]
```

---

## 주요 명령어

| 명령어         | 설명                   | 예시                                           |
| ----------- | -------------------- | -------------------------------------------- |
| `search`    | 패키지 검색               | `winget search git`                          |
| `install`   | 패키지 설치               | `winget install git.git`                     |
| `uninstall` | 패키지 제거               | `winget uninstall git.git`                   |
| `upgrade`   | 패키지 업그레이드            | `winget upgrade` 또는 `winget upgrade git.git` |
| `list`      | 설치된 앱 목록 확인          | `winget list`                                |
| `show`      | 패키지 정보 표시            | `winget show git.git`                        |
| `source`    | 소스 관리 (추가/삭제 등)      | `winget source list`                         |
| `export`    | 설치 목록을 JSON 파일로 내보내기 | `winget export -o packages.json`             |
| `import`    | JSON 파일로 앱 일괄 설치     | `winget import -i packages.json`             |
| `settings`  | 설정 파일 열기             | `winget settings`                            |
| `features`  | 사용 가능한 실험적 기능 보기     | `winget features`                            |
| `configure` | 앱 및 설정 구성 (실험적)      | `winget configure config.yaml`               |
| `validate`  | 설정 파일 유효성 검사         | `winget validate config.yaml`                |
| `hash`      | 설치 파일 해시 생성          | `winget hash somefile.exe`                   |
| `pin`       | 특정 버전 고정             | `winget pin add --id some.app`               |

---

## 자주 쓰는 예시

```powershell
winget install vscode       # Visual Studio Code 설치
winget upgrade --all        # 모든 앱 최신 버전으로 업그레이드
winget uninstall zoom       # Zoom 제거
winget list                 # 현재 설치된 앱 목록 보기
winget search chrome        # 크롬 검색
winget export -o list.json  # 현재 설치된 목록을 json으로 내보내기
winget import -i list.json  # json 기반으로 앱 일괄 설치
```

---

## 🔒 관리자 권한 필요 명령어

* 일부 앱 설치/제거 시 **관리자 권한** 필요
* `PowerShell`이나 `명령 프롬프트`를 **관리자 권한으로 실행**해야 함