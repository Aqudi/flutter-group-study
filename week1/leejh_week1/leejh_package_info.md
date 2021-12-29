# flip_cart package

자세한 내용은 [공식 문서](https://pub.dev/packages/flip_card)에서 볼 수 있습니다.

---

## FlipCard Widget의 property

- front: 앞면의 카드를 나타낼 Widget을 받음 (required property 임으로 반드시 설정해야함)
- back: 뒷면의 카드를 나타낼 Widget을 받음 (required)
- speed: 카드의 회전 속도를 millisecons 단위로 받음
- onFlip: 카드가 뒤집힐 때 수행할 Function을 받음
- onFlipDone: 카드가 다 뒤집힌 후 수행할 Function을 받음
- direction: 카드의 뒤집히는 방향을 정함 (HORIZONTAL or VERTICAL)
- controller: 아직 이에 대한 개념이 없어서 나중에 작성하겠음
- flipOnTouch: 카드 클릭시 뒤집기 가능 / 불가능 설정 (true, false)
- alignment: front와 back으로 받은 Widget 정렬
- fill: front와 back의 Widget의 크기가 다른 경우 사용 (FILL.none, FILL.front, FILL.back)

---

## 해당 패키지를 사용해보면서 들었던 의문점 & 알게 된 점

controller를 사용하지 않는 경우 StatelessWidget으로 FlipCard Widget의 사용이 가능했다.  
FlipCard의 경우 카드가 뒤집히는 애니메이션이 있기에 당연히 StatefulWidget으로 받아야하는 줄 알았다.  
이건 내가 Stateless와 Stateful을 잘 못 이해한거였다.  
애니메이션 상태가 변하지 않기 때문에 StatelessWidget에 넣어도 아무런 문제가 없는거였다.

_결론_: 화면이 변하면 Stateful이 아니라 상태가 변한 걸 받아줘야 될 때 Stateful을 사용하는거였다. 사실 아직도 Stateless랑 Stateful에 대한 개념이 흔들리는데 flutter를 더 써보면서 알아가보겠다.

---

## Source Code

[바로가기](./package_study1/lib/main.dart)
