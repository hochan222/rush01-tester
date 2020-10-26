# rush01-tester
**[Rush00 Tester (piscine) | 2020.10](https://github.com/hochan222/rush00-tester)**
**[Rush01 Tester (piscine) | 2020.10](https://github.com/hochan222/rush01-tester)**

문제 풀 때와 동료평가시 활용해보세요.   
[사용 방법](#사용방법)  
추가하고싶은 테스트 케이스가 있으면 PR이나 Issue로 남겨주세요! 언제나 환영입니다 :)  

Use it for problem solving and peer evaluation.  
[How to use](#사용방법)  
If you have a test case you want to add, please leave it as a PR or Issue! It's always welcome :)  

<img src="https://user-images.githubusercontent.com/22424891/97175504-f70a0000-17d6-11eb-8c77-a8bdcd4707d6.gif" height="300px" />

<img src="https://user-images.githubusercontent.com/22424891/97175518-fa04f080-17d6-11eb-9d25-e0287ba6cb54.gif" height="300px" /> 

### 사용방법

```
.
├── *.h
├── *.c
├── rush01
├── _rush01-tester
|   ├── _input
|   ├── _maps
|   ├── .gitignore
|   ├── LICENSE
|   └── README.md
|   └── test.sh
|   ├── ...
└── ...
```

1. __Download a git clone to the folder where your rush01 executable is located.__  

If there is no rush01 file, the following error will occur.  

<img width="383" alt="Screen Shot 2020-10-26 at 6 06 45 PM" src="https://user-images.githubusercontent.com/22424891/97175812-6a137680-17d7-11eb-84a9-2d82a7e2199e.png">

2. __Run the test.sh file__

```
cd rush01-tester
sh test.sh
```

3. __A diff record is created in the generated result file.__

<img src="https://user-images.githubusercontent.com/22424891/96731034-c8b0ad00-13f1-11eb-81e8-c896fc0d6cd5.png" height="200px" />

### Patch Note

- Add 55 exceptions | 2020.10

- - -
기타 문의 사항은 Slack ID holee로 DM 주세요!
