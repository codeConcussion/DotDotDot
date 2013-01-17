::;lt::
IniRead, company, DotDotDot.ini, Phrases, Company
Send %company%
return

::;tk::
IniRead, name, DotDotDot.ini, Phrases, Name
Send %name%
return

::;uid::
IniRead, userId, DotDotDot.ini, Phrases, UserId
Send %userId%
return

::;up::
IniRead, profile, DotDotDot.ini, Phrases, Profile
Send %profile%
return

::;email::
IniRead, email, DotDotDot.ini, Phrases, Email 
Send %email%
return

::;ii::INSERT INTO

::;l::
Send LIKE '`%`%'{Space}
Send {Left 3}
return

::;ssf::
Send SELECT * FROM{Space}
return

::;stf::
Send SELECT TOP 100 * FROM{Space}
return

::;ssfw::
Send SELECT * FROM  WHERE{Space}
Send {Left 7}
return

::;sf::
Send SELECT  FROM{Space}
Send {Left 6}
return

::;sfw::
Send SELECT  FROM  WHERE{Space}
Send {Left 13}
return
