<?php
$sql="
SELECT   c.hostname 
, COALESCE(s.next_check,UNIX_TIMESTAMP()-1)           AS next_ping
, MIN(c.timestamp)                                  first_hit 
, MAX(c.timestamp)                                  last_hit 
, COUNT(* )                                         hits 
, MAX(c.timestamp) - MIN(c.timestamp)               elap 
, (MAX(c.timestamp) - MIN(c.timestamp)) / COUNT(* ) secs_per_page 
, COALESCE(COUNT(* ) / NULLIF((MAX(c.timestamp) - MIN(c.timestamp)),0),0) * 60 pages_per_min 
FROM     accesslog c 
INNER JOIN (SELECT   a.hostname 
FROM     accesslog a 
LEFT JOIN blocked_ips b 
ON b.ip = a.hostname 
WHERE    (PATH IN (:supect_urls)) 
AND (uid = 0) 
AND b.iid IS NULL 
AND ((UNIX_TIMESTAMP() - a.timestamp) < :suspect_timespan) 
GROUP BY a.hostname 
HAVING   COUNT(* ) > :suspect_hit_count
LIMIT 50
) d 
ON c.hostname = d.hostname 
LEFT JOIN (SELECT DISTINCT hostname 
FROM   accesslog 
WHERE  uid IN (:safe_users)
LIMIT 50
) e 
ON e.hostname = c.hostname 
LEFT JOIN osg_spammers s 
ON s.hostname = c.hostname 
WHERE    (e.hostname IS NULL) 
AND ((UNIX_TIMESTAMP() - c.timestamp) < :recent_timespan) 
GROUP BY hostname 
HAVING   (hits > :floor) 
AND ((pages_per_min > :max_pages_per_min) 
OR (elap = 0)) 
LIMIT 50
";
$params[':supect_urls'] = variable_get('osg_spammer_suspect_paths', explode(',', 'user/password,user/login,user/register'));
$params[':floor'] =$floor;
$params[':recent_timespan'] = variable_get('osg_spammer_recent_ping_boundary',86400);
$params[':suspect_timespan'] = variable_get('osg_spammer_suspect_timespan',86400);
$params[':suspect_hit_count'] = variable_get('osg_spammer_suspect_hit_count',3);
$params[':safe_users'] = variable_get('osg_spammer_safe_users', explode(',', '1'));
$params[':max_pages_per_min'] = variable_get('osg_spammer_max_pages_per_min',3);

