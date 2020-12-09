//
//  day9.swift
//  day8
//
//  Created by Ryan Johnstone on 09/12/2020.
//

import Foundation

func day9(){
    let lines = input.components(separatedBy: .newlines).map { Int($0)! }

    func partA() -> Int {
        for (index, number) in lines.enumerated() {
            if index < 25 {
                continue
            }

            var found = false
            for i in index-25...index-2 {
                for j in i+1...index-1 {
                    let sum = lines[i] + lines[j]
                    if sum == number {
                        found = true
                    }
                }
            }
            if !found {
                return number
            }
        }

        fatalError()
    }

    let partANum = partA()

    func partB(input: Int) {
        for (index, number) in lines.enumerated() {
            var minNum = number
            var maxNum = number
            var sum = number
            var i = index + 1
            while sum < input {
                minNum = min(minNum, lines[i])
                maxNum = max(maxNum, lines[i])
                sum += lines[i]
                if sum == input {
                    print("SOL: \(minNum + maxNum)")
                }
                i += 1
            }
        }
    }

    partB(input: partANum)

}

fileprivate let input = """
19
30
13
31
42
41
44
34
39
6
47
50
36
33
32
15
43
8
26
24
48
5
3
10
1
20
4
7
9
22
11
12
16
13
14
17
6
28
57
18
19
15
21
8
23
24
25
5
26
10
27
20
29
30
33
22
43
78
31
32
41
11
13
16
56
28
37
40
15
35
18
38
21
23
24
70
34
26
45
27
102
29
33
36
108
31
32
39
41
42
46
78
50
56
44
47
48
152
104
84
64
68
53
58
136
60
61
67
106
71
63
73
80
88
108
90
97
114
148
143
118
198
133
111
121
117
113
161
124
123
131
256
130
134
136
222
153
185
178
233
203
208
232
234
245
224
237
228
274
244
230
236
276
267
253
398
264
266
356
289
397
661
436
381
411
440
609
452
458
525
889
496
464
666
466
565
500
517
520
519
530
553
702
686
893
792
894
957
1132
851
892
1453
982
1478
1409
985
930
964
1422
966
1017
1019
1036
1221
1818
1232
1239
2053
1537
1643
1684
1912
1743
1781
1815
1822
1894
2249
1947
3065
1896
1930
2036
2460
2779
2923
2471
4513
2453
2769
2882
3020
3590
3427
5018
3728
3524
3558
3596
4924
3966
4699
4720
8223
4918
11951
6043
4496
4913
5232
8147
5222
5335
8471
5651
8054
6447
6951
14918
7082
13398
10145
8462
7562
9414
8665
9195
9638
10150
9409
9718
9728
9831
10567
10454
10557
10873
10986
16033
12098
19142
17200
16024
17860
14644
18916
16227
16757
25864
18074
19549
18833
19047
19559
19127
20285
29483
21430
21011
28855
54719
36318
31647
31014
50789
51299
36987
30668
31401
35060
32984
34301
34831
36907
37121
37880
56713
38174
40989
81803
41296
42441
49866
69527
63048
61682
62415
62661
65499
62069
63652
65702
64385
67285
70105
78417
69132
71738
94593
75001
76054
100243
131793
83430
105681
83737
104123
111548
142286
128117
123751
142069
124730
125721
126454
130087
131670
195489
136417
139237
217287
170647
155168
151055
158431
260168
167167
211547
187553
187860
258124
234210
236278
248481
249472
303584
250451
285255
252175
286838
266504
268087
474698
294848
329078
306223
419342
318222
309486
378714
535706
354720
375413
421763
422070
470488
519465
484759
497953
551759
539013
516955
575990
534591
649568
954704
577573
601071
604334
615709
624445
733434
627708
664206
839479
976484
776483
797176
1090772
892558
1331767
1144663
982712
1014908
1215965
1404191
1334505
1110581
1380817
1178644
1181907
2346675
1803089
1220043
1573659
1252153
1291914
2583920
1615962
1887064
2192449
2350142
1689734
2947752
1875270
2159571
1997620
3303030
2125489
2289225
3291255
4594944
2292488
3127423
2360551
4233739
2825812
4045855
2511957
6522964
2544067
2907876
3305696
4669556
9825994
3565004
3687354
3815223
4290108
3872890
4123109
4649776
4414714
4417977
6635066
4653039
4872508
10450289
4904618
5056024
5337769
5369879
5451943
5419833
5849763
6109071
7197984
7178586
8621028
11301695
7252358
8525929
8995617
8777508
7995999
8537823
12070492
8832691
16617027
9525547
11831625
10324451
9960642
22726098
10393793
14447560
10789712
10871776
16502864
11958834
13361429
15873386
17576809
16521928
15248357
15778287
16533822
17315331
16773507
16828690
20664316
18358238
18793333
19486189
24772011
20285093
30609544
20354435
21183505
21265569
42568378
27563219
27207191
29883357
32021864
28609786
31026644
31770285
31782179
32077047
32312109
33307329
45955516
39771282
36314879
40058902
39147768
51508053
39840624
60413337
69775569
41537940
67757554
42449074
53577678
62195466
54770410
55816977
58493143
59636430
60380071
62796929
63552464
72135949
64389156
88077739
72455097
82270395
78763953
97640911
78988392
158054248
81378564
82289698
117966834
83987014
130554483
141906825
173003557
108348088
121290072
185718650
114310120
118129573
160213688
255273952
126349393
164560093
136525105
136844253
151219050
154744795
195688684
157752345
160366956
161278090
163668262
196599818
208639091
192335102
198297134
226477661
234697481
222658208
232439693
416552042
250835225
387360330
244478966
262874498
314887312
263193646
273369358
321645046
288063303
567771092
451731565
402231311
318119301
324035218
485851854
356003364
388934920
406936225
556342527
420955342
449135869
510721511
467137174
495314191
507353464
764023181
393911906
532542269
526068144
578080958
561432661
591488659
909584775
676998223
642154519
674122665
680038582
739074643
1036789655
912345891
805139233
814867248
919980050
1446048194
1404898966
1684003231
1355511840
1068786125
2760410806
1036066425
926454175
1070910129
1255079181
1087500805
2035550422
1727213139
2715589004
1316277184
1678220944
1322193101
1586468556
2657378685
1544213876
1620006481
1717485124
2106976554
1734847298
1962520600
2242731359
2385063309
3926734590
3697367898
2546460656
1997364304
2248647276
2013954980
2631714681
2707507286
2403777989
2866406977
3617370785
3559008543
2638470285
2908661657
3057040399
4601254275
3164220357
7176379328
3337491605
3976475580
3732211602
3748802278
3959884904
5406951716
4246011580
5556372847
4262602256
4011319284
4401142293
6643033965
4417732969
5035492670
5923447376
5042248274
6246153262
5547131942
11470579318
5695510684
5965702056
6221260756
7086293883
6501711962
7313967185
9298094926
8791050552
16612062111
9436634963
9516257751
8412461577
8257330864
8273921540
8429052253
14394754309
8818875262
9453225639
9459981243
10077740944
25910157037
10589380216
11242642626
11512833998
13815679147
11661212740
19935134280
16702973793
13588005845
15292762514
18351662484
21590574942
16531252404
17790179291
27788297447
24943713981
16686383117
17076206126
17727147179
35987897981
18272100901
18278856505
27804888123
25249218585
20667121160
27275763333
21832022842
22755476624
34882914888
28364186533
29933313641
46156550607
30290979638
31860106746
31824014918
33217635521
33607458530
34258399583
54266754486
33762589243
34958484018
44881094249
55639949866
40110879347
36550957406
38939222061
41034333129
61038352576
42499144002
43422597784
89149669374
68565942548
65254620626
84991973596
58297500174
60224293279
75069363365
62114994556
69216883601
97073478574
90817711892
70313546649
68721073261
101054216617
71509441424
95996836594
115180242712
75490179467
76661836753
77585290535
79973555190
112143671045
85921741786
101720097958
162328099200
118521793453
170791267082
120412494730
122339287835
127018573435
146975383402
137937956862
131331878157
139034619910
140230514685
173582127129
141822988073
169775289878
211177079306
146999620891
152152016220
154247127288
153075470002
239162244480
157558845725
307322597290
187641839744
204443535239
233051976115
238934288183
253671165992
259447114640
329464827817
284407348159
518499676596
270366498067
406634103244
509528742547
279265134595
293305984687
288822608964
327334135603
476464448708
299151637111
300075090893
305227486222
552753099327
310634315727
443605779719
390610821840
392085374983
509671021461
437495511354
526357960802
492605454175
513118280632
529813612707
569518135178
610709406620
575593984289
549631632662
568087743559
604379123333
671350509578
598533470909
587974246075
1026096081370
599226728004
791757091286
1079189156639
996464498316
754240095446
748129827081
782696196823
828106333194
829580886337
930100965529
987127144016
1105407596996
1022419066882
1111651751541
1079445245369
1137605878737
1117719376221
1166621214468
1148165103571
1370670442898
1186507716984
1187200974079
1584438744391
1342214341521
1347356555085
1353466823450
1545997186732
1502369922527
1530826023904
2300771408427
2243013475733
1610802530017
2495521658656
1816708030353
1917228109545
2009546210898
3827452220124
2160024945619
2581815167896
2648545400125
2255325254958
2518835546469
2314786318039
2334672820555
2373708691063
2528722058505
2529415315600
2689570896606
2700823378535
3319077952880
2899464010182
3911573938444
3033195946431
3347534054257
3427510560370
3528030639562
3620348740915
3733936139898
3926774320443
4077253055164
4169571156517
4415350200577
5015609696574
4570111572997
4833621864508
8481685511441
4649459138594
6261447140998
4708381511618
7733085874690
5932659956613
5218986212206
11171256408047
5600287388717
6427494649744
11810338929854
6380730000688
6460706506801
6775044614627
7161446700268
8496885893440
8567558004406
9723991208192
8004027375607
8246824211681
9064809339171
13315307375949
9219570711591
9278493084615
9357840650212
9927367723824
9868445350800
17925398654618
10308668900335
10819273600923
13155774615315
11599716212894
11981017389405
15021868826308
16381017411859
12841436507489
20819286924485
17466394923272
13936491314895
19002484292807
25536207527789
16250851587288
20032660108527
17068836714778
17311633550852
25136792004720
18498063796206
24245160215230
19285208374036
21338858039617
23975048216238
22418989813817
23660710108412
21127942501258
22800290990328
24755490828209
28668552927672
27002886215713
26777927822384
32631868999147
29092288094777
30187342902183
39869127705106
31005328029673
49124948203304
"""
