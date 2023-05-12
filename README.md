# kpc_shoppingmall

한 줄 요약 : `Firebase`를 활용하여 간단히 서버를 구축하고 앱과 연결시킬 수 있다.

## 컨셉

`Firebase`의 `Auth`, `Firestore` 기능을 활용하여 간단한 로그인과 상품 조회, 장바구니 기능까지 구현하겠습니다.

## 화면

1. 로그인 화면
2. 회원가입 화면
3. 상품 목록 조회 화면
4. (시간 되면) 장바구니 화면

## 기능

1. (`firebase`) 이메일 기반 회원가입, 로그인
2. (`firebase`) 상품 목록 조회
3. (`firebase`) (시간 되면) 상품 상세정보 조회
4. (`firebase`) (시간 되면) 상품 장바구니에 담기

## 모델

1. item
2. item_cart

## 파이어베이스 설치 명령어

1. firebase cli 설치
   1. 바이너리 다운로드
   2. 환경변수 등록
2. cmd를 열어 firebase cli 실행, 로그인
    ```bash
      $ firebase login
    ```
3. firebase console 접속, 플러터 프로젝트 생성
4. 프로젝트 생성 후 나와있는 명령어 절차 수행
    ```bash
      $ dart pub global activate flutterfire_cli
      $ flutterfire configure --project=kpc-shopping
    ```
5. 코드 추가, 패키지 설치
   ```dart
    import 'package:firebase_core/firebase_core.dart';
    import 'firebase_options.dart';

    // ...

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
   ```