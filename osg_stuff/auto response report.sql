SELECT (FLOOR(UNIX_TIMESTAMP()/86400)- FLOOR(updated/86400)) dayspan
,q.label
, q.inserted notification_time
, q.updated response_time
,updated-inserted lag_time
, u.user_name
, CONCAT(u.first_name,' ',u.last_name) display_name
, i.title
, i.start_time_unix
, u.uid
, u.voice_part
FROM osg_auto_registration_request q
INNER JOIN osg_users u ON q.uid=u.uid
INNER JOIN osg_ical_imported i ON q.nid = i.nid
WHERE updated IS NOT NULL
ORDER BY updated