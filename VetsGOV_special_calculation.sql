select distinct u.UUID, s.dcsid, s.veteranID, v.downloaddate, ISNULL(count(distinct d.imageid), 0) Docs, u.NumDocs
                                             from smsDCSMapping s
                                             left join document d
                                             on s.dcsid = d.dcsID
											 left join DCSID_UUID_mapping u
											 on s.dcsid = u.DCSID
											 left join vvFTPDetails v
											 on u.UUID = v.uuid
                        left join PhysicalBatch p
                        on s.batchname = p.PBatch
                                             where s.ackTime is not null and s.batchname like '04%' 
                                             and p.cordest = 'VTG' 
											 and s.acktime >= '2018-11-01' 
											 and s.acktime <= '2018-11-30 23:59:59.999'
											 group by u.UUID, s.dcsid, s.veteranID, v.downloadDate, u.NumDocs
											 order by v.downloadDate