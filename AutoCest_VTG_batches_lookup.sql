--find autocest vtg batches
select d.batchname, d.STime, s.veteranID, s.ackTime, s.errTime
                                        from dmhsFTPDetails d
                                        left join smsDCSMapping s
                                        on SUBSTRING(d.batchname, 16,7) = s.veteranID
                                        where len(d.batchname) > 18
                                        and d.batchname like '04%'
                                        and d.STime >= '2020-07-01'
                                        and s.errTime is not null
                                        and s.ackTime is null