
function cm = thermal(n, opt_interp)
% Colormap: thermal
% Source:   matplotlib/mpl
% Authors:	Stéfan van der Walt and Nathaniel Smith

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
    0.015556	0.138244	0.201811
    0.016202	0.141051	0.208977
    0.016856	0.143827	0.216239
    0.017526	0.146572	0.223600
    0.018219	0.149283	0.231062
    0.018941	0.151961	0.238627
    0.019700	0.154601	0.246305
    0.020503	0.157204	0.254097
    0.021367	0.159766	0.261999
    0.022303	0.162288	0.270013
    0.023325	0.164765	0.278141
    0.024447	0.167197	0.286386
    0.025686	0.169580	0.294748
    0.027059	0.171913	0.303231
    0.028586	0.174193	0.311835
    0.030288	0.176417	0.320562
    0.032190	0.178582	0.329414
    0.034318	0.180685	0.338391
    0.036701	0.182722	0.347495
    0.039371	0.184690	0.356724
    0.042305	0.186585	0.366080
    0.045441	0.188404	0.375561
    0.048799	0.190141	0.385166
    0.052386	0.191794	0.394891
    0.056209	0.193356	0.404733
    0.060276	0.194825	0.414686
    0.064595	0.196188	0.424771
    0.069173	0.197446	0.434957
    0.074014	0.198594	0.445232
    0.079126	0.199625	0.455597
    0.084521	0.200528	0.466051
    0.090194	0.201308	0.476548
    0.096164	0.201947	0.487104
    0.102425	0.202452	0.497665
    0.108994	0.202809	0.508227
    0.115860	0.203027	0.518725
    0.123042	0.203094	0.529148
    0.130528	0.203022	0.539420
    0.138310	0.202820	0.549477
    0.146380	0.202500	0.559246
    0.154719	0.202085	0.568642
    0.163297	0.201605	0.577568
    0.172073	0.201103	0.585918
    0.180992	0.200627	0.593592
    0.189990	0.200234	0.600497
    0.199000	0.199980	0.606565
    0.207953	0.199916	0.611757
    0.216790	0.200083	0.616067
    0.225460	0.200507	0.619523
    0.233931	0.201199	0.622176
    0.242179	0.202159	0.624098
    0.250197	0.203373	0.625368
    0.257986	0.204821	0.626069
    0.265554	0.206480	0.626278
    0.272915	0.208324	0.626068
    0.280083	0.210328	0.625501
    0.287068	0.212469	0.624642
    0.293885	0.214725	0.623538
    0.300558	0.217076	0.622225
    0.307084	0.219506	0.620755
    0.313492	0.221998	0.619145
    0.319780	0.224542	0.617434
    0.325970	0.227124	0.615633
    0.332058	0.229737	0.613777
    0.338066	0.232372	0.611866
    0.343992	0.235022	0.609928
    0.349846	0.237681	0.607969
    0.355638	0.240344	0.605995
    0.361369	0.243009	0.604024
    0.367043	0.245671	0.602061
    0.372671	0.248327	0.600106
    0.378255	0.250974	0.598166
    0.383796	0.253612	0.596250
    0.389299	0.256239	0.594362
    0.394769	0.258852	0.592500
    0.400210	0.261451	0.590666
    0.405624	0.264035	0.588863
    0.411014	0.266603	0.587093
    0.416383	0.269154	0.585357
    0.421731	0.271688	0.583658
    0.427063	0.274205	0.581994
    0.432382	0.276704	0.580364
    0.437689	0.279184	0.578768
    0.442986	0.281646	0.577205
    0.448276	0.284089	0.575675
    0.453560	0.286513	0.574176
    0.458841	0.288918	0.572709
    0.464120	0.291304	0.571271
    0.469399	0.293670	0.569861
    0.474680	0.296017	0.568477
    0.479963	0.298345	0.567118
    0.485252	0.300652	0.565782
    0.490547	0.302940	0.564466
    0.495850	0.305208	0.563169
    0.501162	0.307457	0.561889
    0.506485	0.309685	0.560622
    0.511819	0.311894	0.559367
    0.517167	0.314083	0.558121
    0.522529	0.316252	0.556882
    0.527906	0.318401	0.555646
    0.533299	0.320531	0.554412
    0.538709	0.322641	0.553175
    0.544138	0.324732	0.551934
    0.549585	0.326803	0.550686
    0.555051	0.328855	0.549427
    0.560538	0.330889	0.548155
    0.566045	0.332903	0.546866
    0.571572	0.334900	0.545558
    0.577121	0.336878	0.544228
    0.582692	0.338839	0.542872
    0.588284	0.340783	0.541488
    0.593898	0.342710	0.540072
    0.599534	0.344621	0.538621
    0.605192	0.346516	0.537133
    0.610871	0.348396	0.535604
    0.616571	0.350261	0.534033
    0.622291	0.352113	0.532415
    0.628032	0.353951	0.530748
    0.633793	0.355778	0.529030
    0.639572	0.357593	0.527259
    0.645370	0.359398	0.525431
    0.651185	0.361193	0.523544
    0.657016	0.362980	0.521596
    0.662863	0.364759	0.519585
    0.668724	0.366532	0.517508
    0.674598	0.368299	0.515365
    0.680485	0.370063	0.513152
    0.686382	0.371824	0.510869
    0.692288	0.373584	0.508514
    0.698202	0.375344	0.506084
    0.704122	0.377105	0.503580
    0.710047	0.378869	0.501000
    0.715975	0.380637	0.498341
    0.721905	0.382411	0.495604
    0.727834	0.384192	0.492788
    0.733762	0.385983	0.489892
    0.739685	0.387785	0.486915
    0.745602	0.389600	0.483858
    0.751511	0.391430	0.480719
    0.757410	0.393276	0.477499
    0.763296	0.395140	0.474198
    0.769168	0.397026	0.470814
    0.775023	0.398934	0.467350
    0.780859	0.400868	0.463805
    0.786673	0.402829	0.460179
    0.792463	0.404820	0.456473
    0.798226	0.406842	0.452688
    0.803959	0.408900	0.448825
    0.809660	0.410995	0.444884
    0.815326	0.413130	0.440867
    0.820953	0.415308	0.436775
    0.826539	0.417531	0.432611
    0.832081	0.419803	0.428375
    0.837574	0.422127	0.424070
    0.843016	0.424505	0.419699
    0.848403	0.426941	0.415263
    0.853732	0.429438	0.410766
    0.858998	0.431999	0.406210
    0.864197	0.434628	0.401600
    0.869327	0.437327	0.396938
    0.874383	0.440100	0.392229
    0.879361	0.442951	0.387477
    0.884256	0.445882	0.382687
    0.889066	0.448897	0.377863
    0.893784	0.451998	0.373012
    0.898409	0.455189	0.368138
    0.902934	0.458473	0.363249
    0.907358	0.461851	0.358352
    0.911674	0.465327	0.353452
    0.915881	0.468902	0.348558
    0.919974	0.472579	0.343676
    0.923950	0.476358	0.338816
    0.927806	0.480241	0.333985
    0.931540	0.484229	0.329191
    0.935149	0.488322	0.324443
    0.938630	0.492520	0.319749
    0.941983	0.496823	0.315118
    0.945205	0.501230	0.310559
    0.948297	0.505739	0.306080
    0.951257	0.510350	0.301689
    0.954086	0.515059	0.297394
    0.956784	0.519865	0.293202
    0.959351	0.524766	0.289122
    0.961788	0.529758	0.285160
    0.964097	0.534838	0.281322
    0.966280	0.540003	0.277614
    0.968337	0.545251	0.274042
    0.970272	0.550576	0.270610
    0.972089	0.555974	0.267332
    0.973788	0.561443	0.264205
    0.975372	0.566979	0.261232
    0.976843	0.572579	0.258416
    0.978204	0.578240	0.255760
    0.979456	0.583959	0.253264
    0.980601	0.589733	0.250932
    0.981645	0.595558	0.248767
    0.982596	0.601424	0.246784
    0.983448	0.607335	0.244967
    0.984204	0.613291	0.243316
    0.984863	0.619289	0.241832
    0.985434	0.625323	0.240521
    0.985927	0.631384	0.239392
    0.986329	0.637481	0.238429
    0.986641	0.643612	0.237627
    0.986874	0.649770	0.236998
    0.987039	0.655947	0.236546
    0.987116	0.662154	0.236252
    0.987105	0.668393	0.236113
    0.987045	0.674636	0.236155
    0.986901	0.680907	0.236349
    0.986669	0.687206	0.236690
    0.986393	0.693507	0.237203
    0.986036	0.699832	0.237859
    0.985594	0.706183	0.238655
    0.985117	0.712529	0.239614
    0.984552	0.718902	0.240703
    0.983922	0.725287	0.241930
    0.983241	0.731678	0.243298
    0.982469	0.738096	0.244785
    0.981668	0.744506	0.246412
    0.980781	0.750939	0.248153
    0.979838	0.757380	0.250014
    0.978839	0.763828	0.251991
    0.977757	0.770297	0.254072
    0.976648	0.776757	0.256266
    0.975436	0.783249	0.258553
    0.974211	0.789725	0.260947
    0.972884	0.796231	0.263426
    0.971530	0.802728	0.265999
    0.970086	0.809248	0.268653
    0.968606	0.815765	0.271390
    0.967043	0.822301	0.274201
    0.965438	0.828836	0.277086
    0.963752	0.835388	0.280038
    0.962023	0.841941	0.283055
    0.960210	0.848512	0.286133
    0.958358	0.855081	0.289268
    0.956412	0.861672	0.292456
    0.954435	0.868257	0.295695
    0.952349	0.874871	0.298979
    0.950246	0.881473	0.302308
    0.948014	0.888111	0.305675
    0.945782	0.894730	0.309081
    0.943420	0.901385	0.312520
    0.941029	0.908033	0.315991
    0.938533	0.914705	0.319489
    0.935971	0.921385	0.323014
    0.933338	0.928075	0.326562
    0.930592	0.934791	0.330130
    0.927814	0.941500	0.333717
    0.924890	0.948247	0.337320
    0.921941	0.954985	0.340937
    0.918861	0.961753	0.344566
    0.915693	0.968535	0.348206
    0.912449	0.975327	0.351853
    0.909042	0.982157	0.355508
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