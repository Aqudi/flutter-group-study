# 플러터 스터디 Week2 복습

- 세 개의 페이지를 전환하며 볼 수 있는 RootTabPage
  - BottomNavigationBar를 이용해 각 페이지별 버튼 나열
  - 버튼 클릭시 리턴 받는 index를 이용해 해당 index에 맞는 페이지로 전환
  - showDialog를 이용해 상단에 검색 버튼 삽입

- 검색 기능 구현
  - ChangeNotifier를 이용해 Listeners에게 key 전달
  - read : key를 전달받으면 바로 적용 / watch : 전달 받은 key를 기억했다가 리로드시 적용

- 상세 프로필 페이지 구현
  - onTap을 이용해 프로필 클릭시 상세 프로필 페이지 라우팅
  - DecorationImage를 이용해 프로필 배경화면 설정
  - 확인 중인 상세 프로필 대상자와 채팅 가능한 채팅방 이동기능 추가
    - 채팅방 상단에 검색 및 더보기 아이콘
    - 채팅 입력 칸 및 전송 버튼 생성
      - TextFormField
  
- Porvider
  - Flutter에서 사용할 수 있는 대표적인 상태 관리 방법 중 하나
  - Provider는 생성 부분과 소시 부분으로 나누어짐
    - 생성 부분에서는 사용할 데이터 타입 결정하고 Provider 생성
    - 소비 부분에서는 Provider를 통해 데이터를 불러오거나 수정
  - watch: 데이터 값을 화면에 보여주기 위해 데이터 값이 변경되었을 때, 위젯을 재빌드하여 변경된 데이터 값을 보여줌
  - read: 데이터 값을 변경하는 등의 일을 위한 용도, 변경에 따라 재빌드 하지 않음
  - ChangeNotifierProvider
    - ChangeNotifier의 notifyLisnters()를 기다리다 호출되면, 자신의 자식을 재빌드하여 UI를 업데이트