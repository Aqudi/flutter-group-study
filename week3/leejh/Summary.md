# Summary

### 폴더 구조

- lib
    - pages
        - auth
            
            login_page.dart
            
        - chatting
            
            chatting_list_page.dart
            
            chatting_room_page.dart
            
        - friend
            - widgets
                
                profile_avatar.dart
                
                profile_detail.dart
                
                profile_list_tile.dart
                
        - menu
            
            menu_page.dart
            
        - root_tabs
            
            root_tab_page.dart
            
    - services
        
        auth_service.dart
        
        base_service.dart
        
        search_service.dart
        
    - widgets
        
        base_scaffold.dart
        
    
    app.dart
    
    main.dart
    

### 앱의 실행 순서

1. 앱의 실행과 함께 첫 화면으로 LoginPage가  그려진다.
    
    LoginPage의 textfield에 값을 입력한 후 ‘로그인’ 버튼을 클릭하면 AuthService 클래스에 정의된 login 메서드를 수행하며 잠시 동안 로딩이 진행된다.
    
2. 로딩 후 로그인이 완료되면 RootTabPage가 그려진다.
    
    AppBar의 actions 영역에는 search 아이콘 모양의 버튼이 있는데 그 버튼을 누르면 showDialog위젯이 현재 보이는 위젯 위로 나타나며 textfield에 값을 입력한 후 ‘OK’ 버튼을 누르면 입력한 값이 return 된다. 이 값을 가지고 SearchService 클래스에 정의된 search 메서드를 수행하여 친구 목록을 filtering 할 수 있다.
    
    Body에는 총 3개의 페이지(FriendPage(default), ChattingPage, MenuPage) 중 하나가 BottomNavigator에 의해 그려진다.
    
    - BottomNavigator의 첫번째 FriendPage
        
        HookConsumerWidget을 상속받아 AuthService 와 SearchService 의 상태 관리가 이루어지고 Controller의 경우 Controller를 사용하는 Widget이 사용되지 않을 때 반환(dispose)해줘야하는데 이를 useXXXController 를 이용해 dispose 메서드 없이도 반환을 해준다.
        
        friends 리스트를 만들고 ListView.builder 를 이용해 리스트 내 요소들을 보여준다.
        
    - 두번째 ChattingPage
        
        아직 건드린게 없음
        
    - 세번째 MenuPage
        
        ‘로그아웃’ 버튼을 누르면 LoginPage로 돌아간다. ConsumerWidget을 상속받아 Provider 상태 관리를 이용한다.
        
3. MenuPage의 로그아웃 버튼을 눌러 LoginPage로 돌아간다.

### 중요한 개념들

- 비동기 프로그래밍
    
    언제 처리될 지 모르는 코드를 나중에 처리해주는 프로그래밍 기법이다.
    
    해당 코드의 결과물이 뒤의 코드들에 영향을 주면 async / await를 사용하여 결과물을 받고 난 후 뒤의 코드를 처리해줄 수 있다.
    
    자세한 내용은 [사이트](https://brunch.co.kr/@mystoryg/134) 이용
    
- 라우트
    
    다른 페이지로 이동할 때 사용한다. Stack 자료구조를 기본적으로 사용하여 가고 싶은 다음 페이지를 push 하고 이전 페이지로 가고 싶을 때는 pop 해준다.
    
- 컨트롤러
    
    flutter의 몇 몇 widget들은 controller property를 가지고 있는데 이를 이용해 다른 형제 widget들이 해당 widget의 데이터를 사용할 수 있게 해준다.
    
- 상태 관리
    
    setState의 상위 호환이다. BLoC 패턴을 위해 나온 개념이며 UI는 UI만 관리하고 Service logic은 Service에서 관리해주기 위해서 반드시 사용해야한다. 상태 관리 tool로는 여러가지가 있지만 스터디에서는 riverpod을 중점적으로 사용하고 있다.