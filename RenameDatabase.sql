alter database dva
set single_user with rollback immediate

alter database dva modify name = dva3

alter database dva3
set multi_user with rollback immediate