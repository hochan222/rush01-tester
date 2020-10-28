# rush01-tester
**[Rush00 Tester (piscine) | 2020.10](https://github.com/hochan222/rush00-tester)**  
**[Rush01 Tester (piscine) | 2020.10](https://github.com/hochan222/rush01-tester)**

> checked by 42_Polarbear in 42seoul staff

문제 풀 때와 동료평가시 활용해보세요.   
[사용 방법](#사용방법)  
추가하고싶은 테스트 케이스가 있으면 PR이나 Issue로 남겨주세요! 언제나 환영입니다 :)  

Use it for problem solving and peer evaluation.  
[How to use](#사용방법)  
If you have a test case you want to add, please leave it as a PR or Issue! It's always welcome :)  

<img src="https://user-images.githubusercontent.com/22424891/97175504-f70a0000-17d6-11eb-8c77-a8bdcd4707d6.gif" height="300px" />

<img src="https://user-images.githubusercontent.com/22424891/97175518-fa04f080-17d6-11eb-9d25-e0287ba6cb54.gif" height="300px" /> 

### 사용방법

```sh
git clone https://github.com/hochan222/rush01-tester.git && cd rush01-tester && sh test.sh
```

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

<img src="https://user-images.githubusercontent.com/22424891/97179095-c5dffe80-17db-11eb-9261-9ac9e238880c.png" height="200px" />

### How To Contribute

__Contributors will register below.__

Add your example to the input, maps folder and just modify <code>RUSH_GENERAL_TESTCASE</code>
variable in test.sh for next number.  
Please send PR including explanation and result screen.  

If you want to contribute, please send me a DM or email first!  
Rush01-Tester is relatively easy to contribute, so I will not write a separate method.  

The [Rush00-Tester](https://github.com/hochan222/rush00-tester) contribution reference is well written, so please check it out together.  

### Patch Note

- Add 56 exceptions (56) | 2020.10
- ADD 10 exceptions (66) | 2020.10
- FIX [16, 42, 43, 46] exceptions | 2020.10
- ADD 8 argument exceptions (8) | 2020.10
- FIX input fomat "number" => number | 2020.10
- ADD blank exceptions (18) | 2020.10
- ADD format exceptions (16) | 2020.10
- ADD blank exceptions (26) | 2020.10
- FIX diff route | 2020.10
- ADD 10 format exceptions (26) | 2020.10
- ADD 5 NxN exceptions (6) | 2020.10

### Contributor

<table>
  <tr>
    <td align="center"><a href="https://github.com/hochan222"><img src="https://avatars3.githubusercontent.com/u/22424891?s=100&v=4" alt="@hochan222" /><br /><sub><b>holee</b></sub></a>
    <br />
    <!-- <a href="#question-kentcdodds" title="Answering Questions">💬</a> -->
    </td>
    <td align="center"><a href="https://github.com/Err0rCode7"><img src="https://avatars2.githubusercontent.com/u/48249549?s=100&v=4" alt="@hochan222" /><br /><sub><b>Err0rCode7</b></sub></a>
    <br />
    <a href="https://github.com/hochan222/rush01-tester/issues/1" title="Answering Questions">💬</a>
    </td>
    </tr>
</table>

- - -
기타 문의 사항은 Slack ID holee로 DM 주세요!
