# CHUWOL / 추월

> 멈추지 않는 자가 결국 앞선다

CHUWOL은 단순 러닝 기록 앱이 아니라, 매일 달리며 스트릭을 유지하고 내 바로 앞 순위의 타겟을 추월하며 캐릭터를 성장시키는 게이미피케이션 러닝 앱입니다.

러닝 기록, 듀오링고식 스트릭 유지, 1:1 타겟 경쟁, 아바타 성장, 포인트/아이템 경제를 결합해 사용자가 매일 다시 앱에 들어오도록 만드는 것을 목표로 합니다.

## 핵심 컨셉

- 매일 러닝을 통한 스트릭 유지
- 내 바로 앞 순위 유저를 오늘의 타겟으로 지정
- 타겟과의 거리 차이를 홈/러닝 화면에서 확인
- 추월 성공 시 포인트와 성장 보상 지급
- 누적 거리, 스트릭, 추월 수에 따른 아바타 성장
- 포인트로 ICE SHIELD 같은 스트릭 방어권 구매
- 랭킹과 소셜 경쟁을 통한 재방문 유도

## 핵심 사용자 흐름

```text
로그인 또는 게스트 진입
→ 온보딩
→ 권한 안내
→ 홈에서 스트릭과 오늘의 타겟 확인
→ 러닝 시작
→ 실시간 거리/페이스/타겟 거리 측정
→ 러닝 종료
→ 추월 성공/실패 판정
→ 결과 저장
→ 랭킹 반영
→ 아바타 성장
→ 포인트 획득
→ 스트릭 방어권 구매 또는 사용
```

## 차별점

### 1. 1:1 타겟 추월 시스템

전체 랭킹만 보여주는 방식이 아니라, 사용자의 바로 앞 순위 유저를 오늘의 타겟으로 지정합니다.

예시:

- 현재 타겟: 민수
- 타겟이 나보다 0.42km 앞서 있음
- 오늘 0.43km 이상 달리면 추월 성공

### 2. 스트릭 중심 리텐션

속도보다 꾸준함을 중요하게 봅니다. 매일 러닝하면 스트릭이 증가하고, 하루를 쉬면 스트릭이 끊깁니다. 사용자는 이를 막기 위해 ICE SHIELD를 사용할 수 있습니다.

### 3. 성장형 아바타

누적 거리, 스트릭, 추월 성공 수에 따라 캐릭터가 성장합니다.

예시:

- Lv.1 Egg
- Lv.2 Runner
- Lv.3 Neon Sprinter
- Lv.Max Speedster

### 4. 포인트 경제

러닝 성공, 추월 성공, 스트릭 유지에 따라 포인트를 얻고, 포인트로 상점에서 스트릭 방어권 등의 아이템을 구매합니다.

## 기술 스택

### Frontend

- Flutter
- Dart
- go_router
- 모바일 앱 중심 UI
- iPhone 15 Pro 기준 화면 비율 고려
- Neon Dark 디자인 시스템

### Backend

- Supabase
- PostgreSQL
- Supabase Auth
- Supabase Storage: 필요 시 사용
- Supabase Edge Functions: 추후 랭킹, 타겟 매칭, 스트릭 계산에 사용 가능

### Notification

- Firebase Cloud Messaging 예정
- MVP에서는 우선순위 낮음

## 현재 개발 상태

현재는 Supabase 연동 전 단계입니다.

완료된 작업:

- Flutter 프로젝트 구조 정리
- 화면별 파일 분리
- 공통 테마/위젯 분리
- go_router 기반 라우팅 연결
- 하단 네비게이션 이동 연결
- 주요 CTA 화면 이동 연결
- HTML 화면 시안 기반 핵심 MVP 화면 UI 고도화
- 더미 데이터 기반 화면 표시

아직 진행 전:

- Supabase Auth 연동
- 프로필 저장
- GPS 기반 실제 러닝 측정
- 러닝 기록 DB 저장
- 랭킹/타겟 계산
- 스트릭/포인트/아이템 로직

## 프로젝트 구조

```text
chuwol/
├─ frontend/
│  └─ chuwol_app/
│     ├─ lib/
│     │  ├─ main.dart
│     │  ├─ app.dart
│     │  ├─ core/
│     │  │  ├─ theme/
│     │  │  └─ widgets/
│     │  ├─ routes/
│     │  └─ features/
│     ├─ example/
│     └─ pubspec.yaml
├─ supabase/
├─ docs/
└─ README.md
```

## 주요 화면

### MVP 1순위

- HomeDashboardScreen
- RunCountdownReadyScreen
- RunningTrackingScreen
- RunResultSummaryScreen
- RankingTargetScreen
- ProfileAvatarGrowthScreen
- ShopStreakDefenseScreen

### MVP 2순위

- SplashLoginScreen
- OnboardingScreen
- PermissionScreen
- RecordsScreen
- TargetDetailScreen

### MVP 3순위

- AddFriendsSocialScreen
- InstagramStoryShareScreen
- StreakBrokenShieldUseScreen

## 라우팅

```text
/login
/onboarding
/permission
/home
/run-ready
/running
/run-pause
/run-result
/ranking
/target-detail
/friends
/records
/profile
/shop
/streak-broken
/share
```

하단 네비게이션:

- 홈 → `/home`
- 러닝 → `/run-ready`
- 랭킹 → `/ranking`
- 기록 → `/records`
- 프로필 → `/profile`

## 실행 방법

Flutter 프로젝트 위치:

```bash
cd frontend/chuwol_app
```

의존성 설치:

```bash
flutter pub get
```

실행:

```bash
flutter run
```

웹에서 빠르게 확인:

```bash
flutter run -d chrome
```

정적 분석:

```bash
flutter analyze
```

테스트:

```bash
flutter test
```

## 디자인 방향

- Dark mode only
- Black / Deep Dark background
- Neon Lime `#CCFF00`
- Red Alert `#FF4444`
- Gold Tier `#FFD700`
- Card background `#1A1A1A`
- Border `#333333`
- 강한 숫자 타이포그래피
- 네온 글로우
- 둥근 카드
- 스포츠 앱과 게임 UI의 중간 느낌
- Nike Running + Duolingo Streak + Cyber Neon 감성

## HTML 시안

`frontend/chuwol_app/example/`에는 Flutter 구현 전 참고한 HTML 기반 화면 시안이 들어 있습니다.

이 파일들은 앱 실행에는 필요하지 않지만, UI 방향과 화면 디테일을 맞추기 위한 디자인 레퍼런스로 사용할 수 있습니다.

## Supabase DB 설계 초안

### profiles

```sql
id uuid primary key
nickname text
level text
avatar_level int
total_distance double precision
total_overtakes int
points int
created_at timestamp
```

### runs

```sql
id uuid primary key
user_id uuid
distance double precision
duration_seconds int
pace text
calories int
overtake_success boolean
target_user_id uuid
created_at timestamp
```

### streaks

```sql
id uuid primary key
user_id uuid
current_streak int
longest_streak int
last_run_date date
shield_count int
updated_at timestamp
```

### targets

```sql
id uuid primary key
user_id uuid
target_user_id uuid
distance_gap double precision
created_at timestamp
```

### user_items

```sql
id uuid primary key
user_id uuid
item_type text
quantity int
updated_at timestamp
```

## 개발 우선순위

1. HTML 시안 기준으로 나머지 화면 UI 고도화
2. 더미 데이터 모델 분리
3. Supabase 프로젝트 생성 및 DB 테이블 작성
4. 로그인/프로필 저장
5. 러닝 결과 저장
6. 주간 랭킹/타겟 계산
7. 스트릭/포인트/아바타 성장 로직
8. ICE SHIELD 구매/사용 로직
9. GPS 기반 실제 러닝 측정
10. 발표용 시연 플로우 정리

## 발표용 핵심 메시지

CHUWOL의 핵심은 다음 루프입니다.

```text
오늘의 타겟을 확인한다
→ 달린다
→ 타겟을 추월한다
→ 스트릭을 유지한다
→ 캐릭터가 성장한다
→ 포인트로 방어권을 산다
→ 내일 다시 달린다
```

이 루프만 명확하게 보여줘도 CHUWOL의 서비스 설득력은 충분합니다.
