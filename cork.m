
function cm = cork(n, opt_interp)
% Colormap: cork
% Source:   Scientific colour maps
% Authors:	Fabio Crameri

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


% data for colormap
cm = [
    0.170904563	0.099347116	0.298948237
    0.170827291	0.106057156	0.305284382
    0.170659374	0.112627045	0.311586852
    0.170408485	0.119076694	0.317892928
    0.170084695	0.1254548	0.32415611
    0.169698133	0.131751718	0.330399623
    0.169246803	0.13799366	0.336602428
    0.168719772	0.144135912	0.342789008
    0.168144001	0.150246343	0.348924944
    0.167566474	0.156320323	0.355052017
    0.166956132	0.162336797	0.361122966
    0.166285432	0.168307746	0.367194129
    0.165590481	0.174293548	0.373244719
    0.164914914	0.180230641	0.379279597
    0.164250606	0.186193013	0.385293885
    0.163542779	0.192110814	0.391316359
    0.16282184	0.198037062	0.397307175
    0.162117085	0.203993411	0.403310155
    0.161416401	0.209904395	0.409298037
    0.160683675	0.215859534	0.415285774
    0.159981193	0.221787503	0.421270591
    0.159342552	0.227764669	0.427277291
    0.158737585	0.233719775	0.433262499
    0.158144213	0.239730397	0.439262643
    0.157586887	0.245738361	0.44527235
    0.157122881	0.251807777	0.451289612
    0.156760003	0.257862652	0.457304984
    0.156496995	0.263995677	0.463326874
    0.15635571	0.270142486	0.469375566
    0.156368446	0.276330429	0.475409574
    0.156563276	0.282561643	0.481436634
    0.156962952	0.288828064	0.487478281
    0.157627729	0.295139196	0.493494741
    0.158619036	0.301505971	0.499504378
    0.159860287	0.307924034	0.505495905
    0.16155888	0.314390366	0.511466696
    0.16358377	0.320907075	0.517406173
    0.165986967	0.327435712	0.523289197
    0.168887293	0.334022815	0.529123291
    0.172170938	0.340617565	0.534884249
    0.175906579	0.34724121	0.540580207
    0.180111896	0.353851992	0.546201574
    0.184741746	0.360475694	0.55172565
    0.189752129	0.367103323	0.557162389
    0.195151789	0.373711301	0.562497242
    0.2008723	0.380289895	0.567723481
    0.206964985	0.386827662	0.572857112
    0.213268282	0.393340678	0.577872065
    0.21986184	0.39980088	0.582797553
    0.226638394	0.406229519	0.587620435
    0.23355697	0.412596506	0.592359533
    0.240641682	0.41889396	0.596992098
    0.247864637	0.425151875	0.601536156
    0.255144314	0.431348079	0.606001664
    0.262472891	0.437487151	0.610401551
    0.269870491	0.443566137	0.614724604
    0.277285905	0.449597886	0.619003663
    0.284715754	0.455582379	0.623214732
    0.292187464	0.461529927	0.627380287
    0.299670474	0.467443367	0.631515944
    0.307158782	0.473319932	0.635618892
    0.314672459	0.479202914	0.639710015
    0.322231185	0.485062856	0.643781282
    0.329818376	0.490951247	0.647857546
    0.337435679	0.496822405	0.651946074
    0.345107104	0.502731025	0.656043485
    0.352839284	0.508682179	0.660153198
    0.360615942	0.514655406	0.664291595
    0.368491362	0.520667835	0.668462709
    0.376422873	0.526741015	0.672662658
    0.384410654	0.532849664	0.676894119
    0.392486233	0.539012051	0.681151663
    0.400649642	0.545227986	0.685462419
    0.408860898	0.551498011	0.6898016
    0.417166615	0.557817869	0.694170782
    0.425534785	0.564199116	0.698587377
    0.433973188	0.570622525	0.703044993
    0.442509977	0.577113615	0.707530344
    0.451101239	0.583649416	0.712058275
    0.459768619	0.590241845	0.716627475
    0.468510493	0.596897562	0.721221848
    0.477326886	0.603600296	0.725867775
    0.486213815	0.610351751	0.730541884
    0.495179789	0.617163633	0.735256429
    0.504218089	0.624030485	0.74001001
    0.513317034	0.630947123	0.744792181
    0.522489084	0.63791266	0.74961278
    0.531739918	0.644931426	0.754482503
    0.541053686	0.652013206	0.759372188
    0.550445846	0.659135127	0.764308708
    0.559906244	0.666314271	0.769275386
    0.569424894	0.673548993	0.774280042
    0.579027016	0.680824962	0.779322497
    0.588681988	0.688164598	0.784403157
    0.598414978	0.695547408	0.789510067
    0.60822126	0.702980317	0.79465324
    0.618077531	0.710460203	0.799833509
    0.628007675	0.717988978	0.805038644
    0.637994848	0.725568534	0.81027945
    0.64804273	0.733188052	0.815557688
    0.658161323	0.740851152	0.820859671
    0.668333736	0.748566754	0.826194959
    0.678557722	0.7563214	0.831560925
    0.688846432	0.764116481	0.836945915
    0.699174214	0.771954351	0.842358687
    0.709565654	0.779825841	0.847785073
    0.719995249	0.787734579	0.85323361
    0.730468092	0.79567572	0.858694226
    0.740971548	0.803647471	0.864164496
    0.751517906	0.811643917	0.869621305
    0.762067638	0.819652739	0.875069794
    0.772633743	0.827679313	0.880486923
    0.783192189	0.835707932	0.885861903
    0.793728186	0.843719946	0.891161286
    0.8042008	0.851708439	0.896365987
    0.814582841	0.859645366	0.901430942
    0.824833035	0.867496427	0.906319175
    0.834892271	0.875228048	0.91096993
    0.844681426	0.882783554	0.915318036
    0.854108479	0.890109215	0.919296965
    0.863079931	0.897126875	0.922822131
    0.871457993	0.903740065	0.9257973
    0.879116131	0.909866775	0.928132776
    0.885928307	0.915395617	0.929749471
    0.891752637	0.920244524	0.930562402
    0.896480994	0.924319788	0.930503929
    0.900017871	0.92754963	0.929527671
    0.902302757	0.929891926	0.927615537
    0.903309793	0.931313702	0.924769532
    0.903041746	0.931816135	0.921015289
    0.90153634	0.93142761	0.916405783
    0.898869872	0.930191023	0.911008624
    0.895133173	0.928163089	0.904907222
    0.890428277	0.925431568	0.898189117
    0.884882229	0.922072824	0.890954963
    0.878606273	0.918166793	0.883287491
    0.871720304	0.913803166	0.875264857
    0.864319529	0.909047102	0.866951455
    0.856494845	0.903976975	0.858410224
    0.84832996	0.898646348	0.849686275
    0.839892456	0.893103923	0.840806654
    0.831224094	0.887389431	0.831807306
    0.822373227	0.881540826	0.822700425
    0.813369061	0.875576556	0.813505738
    0.804253411	0.869519626	0.80424572
    0.795030805	0.863394002	0.794914918
    0.785729992	0.85719791	0.78553145
    0.776355896	0.85095387	0.776093603
    0.766919941	0.84467412	0.766611116
    0.757439186	0.838351357	0.757090424
    0.747916817	0.83200333	0.747536096
    0.73834863	0.82562011	0.73793894
    0.72875369	0.819217669	0.728321207
    0.719133944	0.812799244	0.718676261
    0.709491237	0.806368304	0.709016695
    0.699822109	0.799920321	0.699323855
    0.690144988	0.793460967	0.689630891
    0.680450435	0.786992247	0.679912102
    0.670762288	0.780513249	0.670203472
    0.661054325	0.774033442	0.660472052
    0.651356812	0.767554949	0.650750792
    0.64165238	0.761081034	0.64102465
    0.631963221	0.754611099	0.631314895
    0.622275593	0.74814167	0.621601458
    0.612606528	0.741676648	0.611910784
    0.602958935	0.735231514	0.60223377
    0.593329577	0.728791754	0.592584772
    0.583717249	0.722367352	0.582940344
    0.574134801	0.715971753	0.573339145
    0.564586868	0.709583791	0.56376421
    0.555069329	0.703218682	0.554213671
    0.545593009	0.696874307	0.544702171
    0.536146561	0.690553817	0.53522575
    0.526751787	0.684261326	0.52579774
    0.517392202	0.678006148	0.516401399
    0.50808013	0.671768	0.507059179
    0.498810294	0.665565873	0.497770736
    0.489584489	0.659392321	0.488513527
    0.480424255	0.65324901	0.479313477
    0.471316943	0.647149624	0.470166703
    0.462250337	0.641071901	0.46106419
    0.453248397	0.635038854	0.452030694
    0.44430836	0.629038465	0.443040097
    0.435417887	0.623076965	0.434098939
    0.426576359	0.61714822	0.425237051
    0.417805644	0.611260193	0.416417509
    0.409092388	0.605401478	0.407658403
    0.400448907	0.599594532	0.398956754
    0.391851798	0.593816522	0.390319563
    0.383329176	0.588074045	0.38174662
    0.374857975	0.582377631	0.373228058
    0.366463772	0.57672784	0.364771748
    0.358121256	0.571096094	0.356386598
    0.349845484	0.565507797	0.348048408
    0.341630577	0.559967691	0.339777874
    0.333481875	0.554449301	0.331541031
    0.325368403	0.548966283	0.323384338
    0.317337027	0.543501748	0.31526641
    0.309359495	0.53806874	0.307190654
    0.301388013	0.532642472	0.299170929
    0.293480882	0.527225433	0.291169444
    0.285595968	0.521797689	0.283192827
    0.277756648	0.51637165	0.275232519
    0.269920781	0.510924629	0.267259669
    0.262077241	0.505440421	0.259339537
    0.25425679	0.499921475	0.251387616
    0.246414103	0.494362559	0.243404561
    0.238586507	0.488728621	0.235471868
    0.230779177	0.483028761	0.227503155
    0.222989643	0.477259768	0.219548783
    0.215187778	0.471413991	0.211617798
    0.207463131	0.465462642	0.203707245
    0.199751292	0.459444805	0.195829265
    0.192157681	0.453316533	0.188052431
    0.184655499	0.447094782	0.180292237
    0.177277125	0.440771206	0.172674938
    0.170037662	0.434355206	0.165162444
    0.162987356	0.427846198	0.157832943
    0.156151388	0.421220439	0.150653165
    0.149541967	0.414518547	0.143671048
    0.143189172	0.407721698	0.136881159
    0.137147108	0.400855392	0.130372824
    0.131420205	0.393882425	0.124008204
    0.126038468	0.386851587	0.118004229
    0.120944184	0.379769715	0.11223524
    0.116309074	0.372622975	0.10675585
    0.111972646	0.365439934	0.101482093
    0.107948262	0.358217659	0.096497846
    0.104303049	0.350971512	0.091908447
    0.100992489	0.343682663	0.087495115
    0.098010261	0.336388686	0.083276321
    0.095259593	0.329103635	0.079325894
    0.092687626	0.321783012	0.075628469
    0.090429609	0.314475678	0.072138674
    0.08831153	0.307178233	0.068912452
    0.086310679	0.299892255	0.06570789
    0.084527556	0.292608734	0.062803529
    0.082750541	0.285338671	0.059986107
    0.081096693	0.278111398	0.057227095
    0.079444574	0.270895954	0.054671318
    0.077857031	0.263703604	0.052230748
    0.076319103	0.256515227	0.049974265
    0.074814009	0.249378821	0.047723785
    0.073375745	0.242277901	0.045554991
    0.071888288	0.235232454	0.043203968
    0.070497374	0.228203173	0.040881301
    0.069268576	0.221218338	0.038290333
    0.067949742	0.214275917	0.035662701
    0.066717024	0.207392727	0.032728878
    0.065545661	0.200533495	0.029942265
    0.064437852	0.193794687	0.027099488
    0.063398175	0.187070009	0.024190781
    0.062387478	0.180394787	0.021212547
    0.061325972	0.173804016	0.018159723
    0.060486272	0.16727865	0.015025615
    0.059680449	0.160767785	0.011816413
   ];


%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp,'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end


end