# winget
`winget`은 **Windows에서 사용하는 공식 패키지 관리자**.

리눅스의 `apt`, `dnf`, `pacman`처럼 **명령어로 앱을 설치, 제거, 업그레이드, 검색**할 수 있게 도와주는 도구이다.

---

## winget 요약

| 항목       | 설명                                 |
| -------- | ---------------------------------- |
| 🔧 이름    | Windows Package Manager (`winget`) |
| 🏢 개발    | Microsoft                          |
| 📅 첫 출시  | 2020년                              |
| 🪟 지원 OS | Windows 10 1809 이상, Windows 11     |
| 📦 주요 기능 | 앱 설치, 제거, 검색, 업데이트, 설정 백업/복원       |
| 🌐 주요 소스 | Microsoft Store, `winget` 커뮤니티 저장소 |

---

## winget 으로 할수있는 일

| 기능      | 설명                  | 예시                           |
| ------- | ------------------- | ---------------------------- |
| 앱 설치    | 명령어로 앱 설치           | `winget install git.git`     |
| 앱 제거    | 설치된 앱 삭제            | `winget uninstall zoom`      |
| 앱 검색    | 설치 가능한 앱 검색         | `winget search chrome`       |
| 업데이트    | 설치된 앱 최신 버전으로 업그레이드 | `winget upgrade`             |
| 목록 보기   | 설치된 앱 목록 확인         | `winget list`                |
| 설정 내보내기 | 설치 앱 목록을 JSON으로 저장  | `winget export -o list.json` |
| 설정 가져오기 | JSON 기반으로 자동 설치     | `winget import -i list.json` |

---

## 장점

* 마이크로소프트 공식 지원 → 안정적임
* GUI 없는 앱도 쉽게 설치 가능
* Microsoft Store + 외부 앱 통합 관리
* 앱 목록을 백업하고 재설치 자동화 가능 (예: 포맷 후 복구가 쉬워짐)

---

## 단점

* GUI가 없는 CLI 도구 (공식은 아니지만 Unigetui라는 GUI도구가 있음)
* 일부 앱은 수동 동의나 관리자 권한이 필요
* 패키지 이름이 정확해야 설치 가능

---

## 정리

> `winget`은 **Windows에서 앱을 명령어로 설치·관리할 수 있게 해주는 공식 도구**다. 
>
> 윈도우 사용자가 개발자처럼 빠르게 앱을 설치하고 관리할 수 있게 해준다.

---