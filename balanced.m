
function cm = balanced(n, opt_interp)
% Colormap: balanced

%-- Parse inputs ---------------------------------------------------------%
if ~exist('n', 'var'); n = []; end
if isempty(n)
   f = get(groot,'CurrentFigure');
   if isempty(f)
      n = size(get(groot,'DefaultFigureColormap'),1);
   else
      n = size(f.Colormap,1);
   end
end

% by default, interpolate in rgb space
if ~exist('opt_interp','var'); opt_interp = []; end
if isempty(opt_interp); opt_interp = 'rgb'; end
%-------------------------------------------------------------------------%

% Data for colormap:
cm = [
	0.093176302	0.111173329	0.261512389
	0.096971515	0.116870211	0.273096307
	0.100968845	0.122393151	0.284910361
	0.104992701	0.127824371	0.296873805
	0.108987402	0.133193504	0.308953837
	0.112922301	0.138513145	0.321152836
	0.116778737	0.143790724	0.333476314
	0.120546337	0.149033050	0.345919271
	0.124215965	0.154244896	0.358482490
	0.127777843	0.159429300	0.371173718
	0.131224383	0.164589927	0.383993898
	0.134549039	0.169730778	0.396940250
	0.137744029	0.174855249	0.410013219
	0.140799625	0.179966094	0.423217378
	0.143707284	0.185067183	0.436550220
	0.146456079	0.190161926	0.450013097
	0.149034824	0.195254479	0.463603624
	0.151430926	0.200349375	0.477318530
	0.153626647	0.205450378	0.491162351
	0.155607304	0.210563899	0.505124198
	0.157353494	0.215696213	0.519197717
	0.158841108	0.220854063	0.533378099
	0.160039631	0.226044805	0.547662685
	0.160920532	0.231279219	0.562030797
	0.161445527	0.236568757	0.576466195
	0.161568758	0.241927173	0.590947281
	0.161235277	0.247371187	0.605444679
	0.160379337	0.252921300	0.619917940
	0.158916570	0.258602209	0.634318393
	0.156738739	0.264444418	0.648583260
	0.153742274	0.270487524	0.662594291
	0.149753985	0.276777291	0.676242887
	0.144619028	0.283370337	0.689330316
	0.138150672	0.290329027	0.701616671
	0.130193748	0.297713748	0.712792806
	0.120705629	0.305562332	0.722510139
	0.109822694	0.313865188	0.730469444
	0.097958434	0.322543102	0.736527165
	0.085700238	0.331466161	0.740771807
	0.073676887	0.340496746	0.743469344
	0.062522326	0.349519738	0.744956297
	0.052832584	0.358460078	0.745545185
	0.045209385	0.367274935	0.745488909
	0.040236313	0.375941852	0.744984137
	0.038315765	0.384453683	0.744174628
	0.039483495	0.392813754	0.743158134
	0.043458439	0.401023710	0.742024305
	0.049624319	0.409095316	0.740816683
	0.057398001	0.417034695	0.739587754
	0.066260175	0.424852150	0.738365012
	0.075827891	0.432557225	0.737169794
	0.085837104	0.440158343	0.736020680
	0.096110239	0.447663575	0.734931252
	0.106530388	0.455080424	0.733911774
	0.117021647	0.462415911	0.732969370
	0.127535798	0.469676720	0.732107497
	0.138043212	0.476868679	0.731329515
	0.148526666	0.483997075	0.730637447
	0.158977437	0.491066660	0.730032263
	0.169392710	0.498081677	0.729514099
	0.179773858	0.505045871	0.729082418
	0.190125288	0.511962510	0.728736144
	0.200453674	0.518834389	0.728473767
	0.210767431	0.525663845	0.728293430
	0.221076366	0.532452758	0.728193011
	0.231391440	0.539202556	0.728170200
	0.241724589	0.545914210	0.728222575
	0.252088596	0.552588230	0.728347690
	0.262496969	0.559224670	0.728543168
	0.272963816	0.565823119	0.728806813
	0.283503686	0.572382711	0.729136734
	0.294131376	0.578902136	0.729531490
	0.304861659	0.585379670	0.729990251
	0.315708939	0.591813222	0.730512976
	0.326686815	0.598200406	0.731100600
	0.337807534	0.604538650	0.731755213
	0.349081800	0.610825312	0.732479680
	0.360516972	0.617057898	0.733279219
	0.372116379	0.623234317	0.734161231
	0.383879879	0.629353056	0.735133747
	0.395802814	0.635413438	0.736206021
	0.407875535	0.641415858	0.737388464
	0.420082560	0.647362065	0.738693084
	0.432406654	0.653254850	0.740129447
	0.444827015	0.659098260	0.741706933
	0.457321093	0.664897388	0.743433526
	0.469865882	0.670658150	0.745315385
	0.482439164	0.676386995	0.747356561
	0.495020555	0.682090613	0.749558904
	0.507592266	0.687775659	0.751922139
	0.520139521	0.693448528	0.754444092
	0.532650656	0.699115198	0.757121020
	0.545115106	0.704781528	0.759949297
	0.557518156	0.710454319	0.762929142
	0.569863540	0.716136514	0.766048833
	0.582148586	0.721832211	0.769302357
	0.594360237	0.727547799	0.772691633
	0.606508090	0.733284448	0.776204111
	0.618586467	0.739046679	0.779838367
	0.630596355	0.744837340	0.783589218
	0.642540329	0.750658769	0.787451064
	0.654418598	0.756513731	0.791420429
	0.666231529	0.762404880	0.795494182
	0.677985039	0.768333286	0.799665997
	0.689675501	0.774302425	0.803936099
	0.701310751	0.780312635	0.808297552
	0.712888531	0.786366856	0.812750218
	0.724411245	0.792466715	0.817291129
	0.735883699	0.798613065	0.821915897
	0.747304439	0.804808451	0.826624336
	0.758675986	0.811054249	0.831413748
	0.770000702	0.817351818	0.836281566
	0.781278949	0.823703053	0.841226553
	0.792511621	0.830109665	0.846247096
	0.803699751	0.836573302	0.851341410
	0.814843108	0.843095970	0.856508454
	0.825942159	0.849679465	0.861746543
	0.836996754	0.856325771	0.867054161
	0.848003834	0.863037787	0.872431563
	0.858962840	0.869817687	0.877876841
	0.869871878	0.876668106	0.883388431
	0.880722595	0.883593761	0.888968981
	0.891512564	0.890597658	0.894615793
	0.902232186	0.897685182	0.900330340
	0.912862953	0.904864678	0.906120192
	0.923390667	0.912143454	0.911987270
	0.933769070	0.919538912	0.917960427
	0.943876858	0.927090582	0.924147841
	0.945024134	0.926727399	0.923201730
	0.940177150	0.917501097	0.912735302
	0.935778818	0.908184960	0.901995897
	0.931619552	0.898845594	0.891124726
	0.927636690	0.889501535	0.880162509
	0.923796372	0.880161994	0.869130663
	0.920076782	0.870832312	0.858042648
	0.916462267	0.861515865	0.846907925
	0.912940970	0.852214830	0.835733513
	0.909503390	0.842930646	0.824524954
	0.906141351	0.833664354	0.813287028
	0.902848240	0.824416497	0.802023499
	0.899618346	0.815187344	0.790737593
	0.896446402	0.805977037	0.779432325
	0.893328098	0.796785406	0.768110064
	0.890258542	0.787612524	0.756773797
	0.887234153	0.778458007	0.745425528
	0.884251522	0.769321424	0.734067206
	0.881307569	0.760202235	0.722700586
	0.878398982	0.751100005	0.711327719
	0.875522024	0.742014483	0.699951135
	0.872674984	0.732944641	0.688571641
	0.869854722	0.723890013	0.677191395
	0.867059662	0.714849511	0.665811199
	0.864285541	0.705823152	0.654434432
	0.861531224	0.696809681	0.643061652
	0.858794561	0.687808247	0.631694417
	0.856073770	0.678817839	0.620334010
	0.853364751	0.669838452	0.608984034
	0.850667181	0.660868451	0.597644543
	0.847980376	0.651906300	0.586315955
	0.845299289	0.642952429	0.575003093
	0.842623326	0.634005273	0.563706494
	0.839952671	0.625062835	0.552425944
	0.837282361	0.616125523	0.541166513
	0.834611501	0.607191842	0.529929293
	0.831941697	0.598258984	0.518712859
	0.829265839	0.589328425	0.507524863
	0.826586519	0.580396807	0.496363079
	0.823900772	0.571463478	0.485231121
	0.821204724	0.562528304	0.474133737
	0.818502844	0.553586637	0.463066997
	0.815785797	0.544641201	0.452041721
	0.813059876	0.535686153	0.441052311
	0.810315730	0.526724255	0.430110003
	0.807560076	0.517749117	0.419209052
	0.804782998	0.508763853	0.408361763
	0.801991364	0.499761627	0.397562629
	0.799177607	0.490744110	0.386821951
	0.796341251	0.481708635	0.376142680
	0.793485339	0.472650097	0.365524290
	0.790602086	0.463570184	0.354978316
	0.787692208	0.454465016	0.344507524
	0.784758443	0.445329010	0.334113002
	0.781794376	0.436162638	0.323806212
	0.778798602	0.426962818	0.313593824
	0.775770031	0.417725986	0.303482882
	0.772707376	0.408448423	0.293481455
	0.769609096	0.399126280	0.283598831
	0.766473314	0.389755621	0.273845732
	0.763297746	0.380332467	0.264234554
	0.760079608	0.370852871	0.254779617
	0.756815523	0.361312990	0.245497441
	0.753501421	0.351709197	0.236407020
	0.750132436	0.342038200	0.227530088
	0.746708368	0.332291733	0.218886810
	0.743220621	0.322468951	0.210507297
	0.739662635	0.312566718	0.202422626
	0.736027659	0.302581706	0.194666968
	0.732307505	0.292511593	0.187278866
	0.728488679	0.282359962	0.180302582
	0.724559780	0.272128351	0.173783039
	0.720505255	0.261823770	0.167768108
	0.716307752	0.251456847	0.162305037
	0.711947751	0.241043167	0.157437692
	0.707404611	0.230602958	0.153202778
	0.702657776	0.220160325	0.149626419
	0.697685638	0.209746246	0.146719337
	0.692470099	0.199392348	0.144475757
	0.686995630	0.189132622	0.142872030
	0.681250939	0.179000572	0.141868492
	0.675229040	0.169028395	0.141412618
	0.668927235	0.159246011	0.141443625
	0.662346293	0.149681499	0.141896697
	0.655489462	0.140362259	0.142706076
	0.648361836	0.131315449	0.143809378
	0.640969090	0.122570899	0.145146662
	0.633317187	0.114161638	0.146663553
	0.625411768	0.106126321	0.148308332
	0.617258094	0.098509559	0.150034282
	0.608861214	0.091362711	0.151794675
	0.600226008	0.084742688	0.153547189
	0.591358067	0.078709380	0.155247596
	0.582264072	0.073321107	0.156852852
	0.572952324	0.068628702	0.158320952
	0.563433725	0.064666960	0.159609712
	0.553722410	0.061446269	0.160677959
	0.543835140	0.058949148	0.161489545
	0.533791213	0.057128581	0.162013812
	0.523611999	0.055910951	0.162226526
	0.513321471	0.055199003	0.162108270
	0.502941512	0.054892687	0.161652120
	0.492492056	0.054894978	0.160859457
	0.481997042	0.055098742	0.159729468
	0.471468531	0.055437530	0.158280357
	0.460929839	0.055818175	0.156516154
	0.450388231	0.056200932	0.154460361
	0.439855045	0.056539675	0.152129640
	0.429339585	0.056798929	0.149541304
	0.418848805	0.056953513	0.146713102
	0.408387475	0.056986797	0.143662615
	0.397958421	0.056888991	0.140406795
	0.387566181	0.056647445	0.136959623
	0.377216256	0.056248587	0.133333288
	0.366900971	0.055710276	0.129545632
	0.356628920	0.055012362	0.125604127
	0.346394614	0.054167131	0.121522106
	0.336201824	0.053165773	0.117307404
	0.326042440	0.052024980	0.112971389
	0.315927857	0.050719341	0.108517515
	0.305844047	0.049276780	0.103956921
	0.295790629	0.047695428	0.099295012
	0.285776169	0.045955169	0.094534697
	0.275788393	0.044077295	0.089683294
	0.265825143	0.042061613	0.084744722
	0.255884056	0.039900466	0.079722365
	0.245962222	0.037625951	0.074619136
	0.236056365	0.035297480	0.069437442
];

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'lab')
    lab = rgb2lab(cm);
    lab = interp1(1:p, lab, linspace(1,p,n), 'linear');
    cm = lab2rgb(lab);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end
