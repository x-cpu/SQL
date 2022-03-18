select T.Queue, T.Vendor, T.[CM Packet #],
T.[Packet Status], T.[VA DOR], T.[Portal Entry Date],
T.[Queue Entry Date], T.[Doc Type], T.EMERG,
T.[Confirmation #], T.[Assigned User], T.[Assigned User Name],
(select CONVERT(nvarchar, xx.newPacketID) + '; '
	from xSPLITS_20201231 xx
	where T.[CM Packet #] = xx.[CM Packet #]
	FOR XML PATH('')) [NewPacketID(s)]
	--into xSPLITS_20201231x
FROM
(select distinct x.Queue, x.Vendor, x.[CM Packet #],
x.[Packet Status], x.[VA DOR], x.[Portal Entry Date],
x.[Queue Entry Date], x.[Doc Type], x.EMERG,
x.[Confirmation #], x.[Assigned User], x.[Assigned User Name]
from xSPLITS_20201231 x) T




select * from xSPLITS_20201231
where newbatch2 in (
'04203640800201',
'04203640800301',
'04203640800401',
'04203640800501',
'04203640800601',
'04203640800701',
'04203640800801',
'04203640800901',
'04203640801001',
'04203640801101',
'04203640801201',
'04203640801301',
'04203640801401',
'04203640801501',
'04203640801601',
'04203640801701',
'04203640801801',
'04203640801901',
'04203640802001',
'04203640802101',
'04203640802201',
'04203640802301',
'04203640802401',
'04203640802501',
'04203640802601',
'04203640802701',
'04203640802801',
'04203640802901',
'04203640803001',
'04203640803101',
'04203640803201',
'04203640803301',
'04203640803401',
'04203640803501',
'04203640803601',
'04203640803701',
'04203640803801',
'04203640803901',
'04203640804001',
'04203640804101',
'04203640804201',
'04203640804301',
'04203640804401',
'04203640804501',
'04203640804601',
'04203640804701',
'04203640804801',
'04203640804901',
'04203640805001',
'04203640805101',
'04203640805201',
'04203640805301',
'04203640805401',
'04203640805501',
'04203640805601',
'04203640805701',
'04203640805801',
'04203640805901',
'04203640806001',
'04203640806101',
'04203640806201',
'04203640806301',
'04203640806401',
'04203640806501',
'04203640806601',
'04203640806701',
'04203640806801',
'04203640806901',
'04203640807001',
'04203640807101',
'04203640807201',
'04203640807301',
'04203640807401',
'04203640807501',
'04203640807601',
'04203640807701',
'04203640807801',
'04203640807901',
'04203640808001',
'04203640808101',
'04203640808201',
'04203640808301',
'04203640808401',
'04203640808501',
'04203640808601',
'04203640808701',
'04203640808801',
'04203640808901',
'04203640809001',
'04203640809101',
'04203640809201',
'04203640809301',
'04203640809401',
'04203640809501',
'04203640809601',
'04203640809701',
'04203640809801',
'04203640809901',
'04203640810001',
'04203640810101',
'04203640810201',
'04203640810301',
'04203640810401',
'04203640810501',
'04203640810601',
'04203640810701',
'04203640810801',
'04203640810901',
'04203640811001',
'04203640811101',
'04203640811201',
'04203640811301',
'04203640811401',
'04203640811501',
'04203640811601',
'04203640811701',
'04203640811801',
'04203640811901',
'04203640812001',
'04203640812101',
'04203640812201',
'04203640812301',
'04203640812401',
'04203640812501',
'04203640812601',
'04203640812701',
'04203640812801',
'04203640812901',
'04203640813001',
'04203640813101',
'04203640813201',
'04203640813301',
'04203640813401',
'04203640813501',
'04203640813601',
'04203640813701',
'04203640813801',
'04203640813901',
'04203640814001',
'04203640814101',
'04203640814201',
'04203640814301',
'04203640814401',
'04203640814501',
'04203640814601',
'04203640814701',
'04203640814801',
'04203640814901',
'04203640815001',
'04203640815101',
'04203640815201',
'04203640815301',
'04203640815401',
'04203640815501',
'04203640815601',
'04203640815701',
'04203640815801',
'04203640815901',
'04203640816001',
'04203640816101',
'04203640816201',
'04203640816301',
'04203640816401',
'04203640816501',
'04203640816601',
'04203640816701',
'04203640816801',
'04203640816901',
'04203640817001',
'04203640817101',
'04203640817201',
'04203640817301',
'04203640817401',
'04203640817501',
'04203640817601',
'04203640817701',
'04203640817801',
'04203640817901',
'04203640818001',
'04203640818101',
'04203640818201',
'04203640818301',
'04203640818401',
'04203640818501',
'04203640818601',
'04203640818701',
'04203640818801',
'04203640818901',
'04203640819001',
'04203640819101',
'04203640819201',
'04203640819301',
'04203640819401',
'04203640819501',
'04203640819601',
'04203640819701',
'04203640819801',
'04203640819901',
'04203640820001',
'04203640820101',
'04203640820201',
'04203640820301',
'04203640820401',
'04203640820501',
'04203640820601',
'04203640820701',
'04203640820801',
'04203640820901',
'04203640821001',
'04203640821101',
'04203640821201',
'04203640821301',
'04203640821401',
'04203640821501',
'04203640821601',
'04203640821701',
'04203640821801',
'04203640821901',
'04203640822001',
'04203640822101',
'04203640822201',
'04203640822301',
'04203640822401',
'04203640822501',
'04203640822601',
'04203640822701',
'04203640822801',
'04203640822901',
'04203640823001',
'04203640823101',
'04203640823201',
'04203640823301',
'04203640823401',
'04203640823501',
'04203640823601',
'04203640823701',
'04203640823801',
'04203640823901',
'04203640824001',
'04203640824101',
'04203640824201',
'04203640824301',
'04203640824401',
'04203640824501',
'04203640824601',
'04203640824701',
'04203640824801',
'04203640824901',
'04203640825001',
'04203640825101',
'04203640825201',
'04203640825301',
'04203640825401',
'04203640825501',
'04203640825601',
'04203640825701',
'04203640825801',
'04203640825901',
'04203640826001',
'04203640826101',
'04203640826201',
'04203640826301',
'04203640826401',
'04203640826501',
'04203640826601',
'04203640826701',
'04203640826801',
'04203640826901',
'04203640827001',
'04203640827101',
'04203640827201',
'04203640827301',
'04203640827401',
'04203640827501',
'04203640827601',
'04203640827701',
'04203640827801',
'04203640827901',
'04203640828001',
'04203640828101',
'04203640828201',
'04203640828301',
'04203640828401',
'04203640828501',
'04203640828601',
'04203640828701',
'04203640828801',
'04203640828901',
'04203640829001',
'04203640829101',
'04203640829201',
'04203640829301',
'04203640829401',
'04203640829501',
'04203640829601',
'04203640829701',
'04203640829801',
'04203640829901',
'04203640830001',
'04203640830101',
'04203640830201',
'04203640830301',
'04203640830401',
'04203640830501',
'04203640830601',
'04203640830701',
'04203640830801',
'04203640830901',
'04203640831001',
'04203640831101',
'04203640831201',
'04203640831301',
'04203640831401',
'04203640831501',
'04203640831601',
'04203640831701',
'04203640831801',
'04203640831901',
'04203640832001',
'04203640832101',
'04203640832201',
'04203640832301',
'04203640832401',
'04203640832501',
'04203640832601',
'04203640832701',
'04203640832801',
'04203640832901',
'04203640833001',
'04203640833101',
'04203640833201',
'04203640833301',
'04203640833401',
'04203640833501',
'04203640833601',
'04203640833701',
'04203640833801',
'04203640833901',
'04203640834001',
'04203640834101',
'04203640834201',
'04203640834301',
'04203640834401',
'04203640834501',
'04203640834601',
'04203640834701',
'04203640834801',
'04203640834901',
'04203640835001',
'04203640835101',
'04203640835201',
'04203640835301',
'04203640835401',
'04203640835501',
'04203640835601',
'04203640835701',
'04203640835801',
'04203640835901',
'04203640836101',
'04203640836201',
'04203640836301',
'04203640836401',
'04203640836501',
'04203640836601',
'04203640836701',
'04203640836801',
'04203640836901',
'04203640837001',
'04203640837101',
'04203640837201',
'04203640837301',
'04203640837401',
'04203640837501',
'04203640837601',
'04203640837701',
'04203640837801',
'04203640837901',
'04203640838001',
'04203640838101',
'04203640838201',
'04203640838301',
'04203640838401',
'04203640838501',
'04203640838601',
'04203640838701',
'04203640838801',
'04203640838901',
'04203640839001',
'04203640839101',
'04203640839201',
'04203640839301',
'04203640839401',
'04203640839501',
'04203640839601',
'04203640839701',
'04203640839801',
'04203640839901',
'04203640840001',
'04203640840101',
'04203640840201',
'04203640840301',
'04203640840401',
'04203640840501',
'04203640840601',
'04203640840701',
'04203640840801',
'04203640840901',
'04203640841001',
'04203640841101',
'04203640841201',
'04203640841301',
'04203640841401',
'04203640841501',
'04203640841601',
'04203640841701',
'04203640841801',
'04203640841901',
'04203640842001',
'04203640842101',
'04203640842201',
'04203640842301',
'04203640842401',
'04203640842501',
'04203640842601',
'04203640842701',
'04203640842801',
'04203640842901',
'04203640843001',
'04203640843101',
'04203640843201',
'04203640843301',
'04203640843401',
'04203640843501',
'04203640843601',
'04203640843701',
'04203640843801',
'04203640843901',
'04203640844001',
'04203640844101',
'04203640844201',
'04203640844301')