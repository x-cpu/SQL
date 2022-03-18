select min(len(filenumber)), ImageID, ftpstime, pbatch from document where ftpstime > '2017-03-01'
group by ImageID, ftpstime, pbatch
order by min(len(filenumber))



select min(len(filenumber)), ImageID, ftpstime, pbatch, FileNumber from document where ftpstime > '2017-03-01'
group by ImageID, ftpstime, pbatch, FileNumber
order by min(len(filenumber))

select sum(T.countX)
FROM
(select count(distinct filenumber) countX from document where ftpstime > '2017-03-01'
group by FileNumber
having len(filenumber) = 8) T

select sum(T.countX)
FROM
(select count(distinct filenumber) countX from document where ftpstime > '2017-03-01'
group by FileNumber
having len(filenumber) = 9) T