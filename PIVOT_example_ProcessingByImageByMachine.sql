
select * 
from 
(
	select distinct tsmodule, convert(nvarchar, t.timestamp, 101) as date, datepart(hh,t.timestamp) as Hour , 
ISNULL(sum(userimagesprocessed), 0) as Images, w.WSName Workstation
-- , 
--sum(userproctime) as proctime 
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.timestamp > '10/28/2016 0:0:0'
and tsmodule in ('docid'
--, 'enhance', 'imageqc'
)
group by convert(nvarchar, t.timestamp, 101) ,datepart(hh,t.timestamp), t.TSModule, w.WSName  
having sum(userimagesprocessed) > 0
---order by tsmodule, convert(nvarchar, timestamp, 101) ,datepart(hh,timestamp) 
) x
pivot
(
sum(Images) for Workstation in (
[ATL-VA-PC163],[ATL-VA-PC441],[atl-va-ts05],[ATL-VA-TSCN141],[bprslond150532],[bprslond150538],[BPRSMTVN130479],[MTA-VA-PC119],[mtv-va-332],[MTV-VA-CHECKIN3],[MTV-VA-CHECKIN4],
[MTV-VA-FSCN-1A],[MTV-VA-FSCN-1B],[MTV-VA-FSCN-1E],[MTV-VA-FSCN-1F],[MTV-VA-FSCN-1G],[MTV-VA-FSCN-1H],[mtv-va-pc0169],[mtv-va-pc100],[MTV-VA-PC1007],[MTV-VA-PC101],[mtv-va-pc102],
[mtv-va-pc103],[mtv-va-pc104],[mtv-va-pc105],[MTV-VA-PC106],[MTV-VA-PC107],[MTV-VA-PC108],[MTV-VA-PC109],[mtv-va-pc110],[MTV-VA-PC111],[mtv-va-pc112],[mtv-va-pc113],
[MTV-VA-PC114],[mtv-va-pc115],[mtv-va-pc116],[mtv-va-pc117],[MTV-VA-PC118],[MTV-VA-PC119],[MTV-VA-PC120],[mtv-va-pc121],[MTV-VA-PC122],[mtv-va-pc123],[MTV-VA-PC124],
[mtv-va-pc125],[MTV-VA-PC126],[mtv-va-pc127],[mtv-va-pc128],[mtv-va-pc129],[MTV-VA-PC130],[mtv-va-pc132],[mtv-va-pc134],[MTV-VA-PC135],[mtv-va-pc137],[mtv-va-pc138],
[mtv-va-pc139],[mtv-va-pc140],[mtv-va-pc141],[MTV-VA-PC142],[MTV-VA-PC144],[mtv-va-pc145],[MTV-VA-PC1455],[mtv-va-pc146],[mtv-va-pc147],[MTV-VA-PC148],[MTV-VA-PC149],
[MTV-VA-PC150],[MTV-VA-PC151],[mtv-va-pc153],[MTV-VA-PC154],[mtv-va-pc156],[mtv-va-pc157],[MTV-VA-PC158],[MTV-VA-PC159],[mtv-va-pc160],[mtv-va-pc161],[mtv-va-pc162],
[mtv-va-pc164],[mtv-va-pc165],[MTV-VA-PC166],[mtv-va-pc167],[mtv-va-pc168],[mtv-va-pc169],[mtv-va-pc170],[mtv-va-pc171],[mtv-va-pc172],[mtv-va-pc173],[mtv-va-pc174],
[mtv-va-pc175],[mtv-va-pc176],[MTV-VA-PC1766],[MTV-VA-PC177],[mtv-va-pc178],[mtv-va-pc179],[mtv-va-pc180],[MTV-VA-PC181],[MTV-VA-PC182],[MTV-VA-PC183],[mtv-va-pc184],
[mtv-va-pc185],[MTV-VA-PC186],[MTV-VA-PC187],[MTV-VA-PC188],[MTV-VA-PC189],[MTV-VA-PC190],[MTV-VA-PC191],[MTV-VA-PC192],[MTV-VA-PC193],[MTV-VA-PC194],[MTV-VA-PC195],
[MTV-VA-PC196],[MTV-VA-PC197],[MTV-VA-PC199],[MTV-VA-PC200],[MTV-VA-PC201],[MTV-VA-PC202],[MTV-VA-PC203],[MTV-VA-PC204],[mtv-va-pc205],[mtv-va-pc206],[MTV-VA-PC207],
[MTV-VA-PC208],[MTV-VA-PC209],[MTV-VA-PC210],[MTV-VA-PC211],[MTV-VA-PC212],[MTV-VA-PC213],[MTV-VA-PC214],[MTV-VA-PC215],[MTV-VA-PC216],[MTV-VA-PC217],[MTV-VA-PC218],
[MTV-VA-PC219],[MTV-VA-PC220],[MTV-VA-PC221],[MTV-VA-PC222],[mtv-va-pc223],[MTV-VA-PC224],[MTV-VA-PC225],[MTV-VA-PC226],[MTV-VA-PC227],[MTV-VA-PC228],[MTV-VA-PC229],
[MTV-VA-PC230],[MTV-VA-PC231],[MTV-VA-PC232],[MTV-VA-PC233],[MTV-VA-PC234],[MTV-VA-PC235],[MTV-VA-PC236],[MTV-VA-PC237],[MTV-VA-PC238],[MTV-VA-PC239],[MTV-VA-PC240],
[MTV-VA-PC241],[MTV-VA-PC242],[MTV-VA-PC243],[MTV-VA-PC244],[MTV-VA-PC245],[MTV-VA-PC246],[MTV-VA-PC247],[MTV-VA-PC248],[MTV-VA-PC249],[MTV-VA-PC250],[MTV-VA-PC251],
[MTV-VA-PC252],[MTV-VA-PC253],[MTV-VA-PC254],[MTV-VA-PC255],[MTV-VA-PC256],[mtv-va-pc257],[mtv-va-pc258],[MTV-VA-PC259],[MTV-VA-PC260],[MTV-VA-PC261],[mtv-va-pc262],
[mtv-va-pc263],[MTV-VA-PC264],[mtv-va-pc265],[mtv-va-pc266],[MTV-VA-PC267],[MTV-VA-PC268],[mtv-va-pc269],[mtv-va-pc270],[MTV-VA-PC271],[mtv-va-PC272],[mtv-va-pc273],
[MTV-VA-PC274],[MTV-VA-PC275],[MTV-VA-PC276],[MTV-VA-PC277],[MTV-VA-PC278],[mtv-va-pc279],[MTV-VA-PC280],[mtv-va-pc281],[MTV-VA-PC282],[MTV-VA-PC283],[mtv-va-pc284],
[MTV-VA-PC285],[MTV-VA-PC286],[MTV-VA-PC287],[MTV-VA-PC288],[mtv-va-pc289],[mtv-va-pc290],[MTV-VA-PC291],[mtv-va-pc292],[MTV-VA-PC293],[mtv-va-pc294],[mtv-va-pc295],
[MTV-VA-PC298],[MTV-VA-PC2988],[MTV-VA-PC299],[mtv-va-pc300],[MTV-VA-PC301],[MTV-VA-PC301363],[mtv-va-pc301657],[MTV-VA-PC301784],[mtv-va-pc301794],[MTV-VA-PC301799],[MTV-VA-PC301809],
[MTV-VA-PC301812],[MTV-VA-PC301819],[mtv-va-pc302],[MTV-VA-PC303],[MTV-VA-PC304],[MTV-VA-PC305],[mtv-va-pc306240],[MTV-VA-PC306269],[MTV-VA-PC306287],[mtv-va-pc30631],[mtv-va-pc306315],
[mtv-va-pc306316],[MTV-VA-PC306325],[MTV-VA-PC306329],[MTV-VA-PC308774],[MTV-VA-PC308779],[MTV-VA-PC309],[MTV-VA-PC315],[MTV-VA-PC316],[MTV-VA-PC317],[MTV-VA-PC318],[MTV-VA-PC319],
[MTV-VA-PC3199],[MTV-VA-PC320],[MTV-VA-PC321],[MTV-VA-PC322],[MTV-VA-PC323],[MTV-VA-PC324],[MTV-VA-PC326],[mtv-va-pc339],[mtv-va-pc346],[mtv-va-pc347],[mtv-va-pc349],
[mtv-va-pc352],[MTV-VA-PC353],[mtv-va-pc354],[mtv-va-pc357],[mtv-va-pc450],[mtv-va-pcww2],[mtv-va-pcww4],[mtv-va-prod1],[MTV-VA-PROD2],[mtv-va-prod3],[MTV-VA-PROD4],
[MTV-VA-PROD5],[mtv-va-rescan01],[mtv-va-rescan02],[mtv-va-rescan03],[mtv-va-rescnkr4],[mtv-va-rk1],[mtv-va-rk10],[mtv-va-rk11],[mtv-va-rk12],[mtv-va-rk13],[mtv-va-rk14],
[mtv-va-rk15],[mtv-va-rk16],[mtv-va-rk17],[mtv-va-rk18],[mtv-va-rk19],[mtv-va-rk2],[mtv-va-rk20],[mtv-va-rk21],[mtv-va-rk22],[mtv-va-rk23],[mtv-va-rk24],
[mtv-va-rk25],[mtv-va-rk26],[mtv-va-rk27],[mtv-va-rk28],[mtv-va-rk29],[mtv-va-rk3],[mtv-va-rk30],[mtv-va-rk31],[mtv-va-rk32],[mtv-va-rk33],[mtv-va-rk34],
[mtv-va-rk35],[mtv-va-rk36],[mtv-va-rk37],[mtv-va-rk38],[mtv-va-rk39],[mtv-va-rk4],[mtv-va-rk40],[mtv-va-rk41],[mtv-va-rk42],[mtv-va-rk43],[mtv-va-rk44],
[mtv-va-rk45],[mtv-va-rk46],[mtv-va-rk47],[mtv-va-rk48],[mtv-va-rk49],[mtv-va-rk5],[mtv-va-rk50],[mtv-va-rk6],[mtv-va-rk7],[mtv-va-rk8],[mtv-va-rk9],
[mtv-va-scan102],[MTV-VA-SCAN103],[MTV-VA-SCAN104],[MTV-VA-SCAN105],[MTV-VA-TSCN101],[MTV-VA-TSCN103],[MTV-VA-TSCN104],[MTV-VA-TSCN105],[MTV-VA-TSCN106],[MTV-VA-TSCN107],[MTV-VA-TSCN108],
[MTV-VA-TSCN109],[MTV-VA-TSCN110],[MTV-VA-TSCN136],[MTV-VA-TSCN137],[MTV-VA-TSCN138],[MTV-VA-TSCN139],[MTV-VA-TSCN140],[MTV-VA-TSCN141],[MTV-VA-TSCN142],[MTV-VA-TSCN143],[MTV-VA-TSCN144],
[MTV-VA-TSCN145],[MTV-VA-TSCN146],[MTV-VA-TSCN147],[MTV-VA-TSCN148],[MTV-VA-TSCN149],[MTV-VA-TSCN150],[MTV-VA-TSCN161],[MTV-VA-TSCN162],[MTV-VA-TSCN163],[MTV-VA-TSCN164],[MTV-VA-TSCN165],
[MTV-VA-TSCN166],[MTV-VA-TSCN167],[MTV-VA-TSCN168],[MTV-VA-TSCN169],[MTV-VA-TSCN170],[MTV-VA-TSCN171],[MTV-VA-TSCN172],[MTV-VA-TSCN173],[MTV-VA-TSCN174],[MTV-VA-TSCN175],[MTV-VA-TSCN176],
[MTV-VA-TSCN177],[MTV-VA-TSCN178],[MTV-VA-TSCN179],[mtv-va-tscn180],[mtv-va-tscn181],[mtv-va-tscn182],[mtv-va-tscn183],[mtv-va-tscn184],[mtv-va-tscn185],[mtv-va-tscn186],[mtv-va-tscn187],
[mv-va-pc325])
) y