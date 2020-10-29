::;address::
IniRead, address, DotDotDot.ini, Phrases, Address
Send %address%
return

::;city::
IniRead, city, DotDotDot.ini, Phrases, City
Send %city%
return

::;email::
IniRead, email, DotDotDot.ini, Phrases, Email
Send %email%
return

::;gmail::
IniRead, gmail, DotDotDot.ini, Phrases, Gmail
Send %gmail%
return

::;lt::
IniRead, company, DotDotDot.ini, Phrases, Company
Send %company%
return

::;lti::
IniRead, fullCompany, DotDotDot.ini, Phrases, FullCompany
Send %fullCompany%
return

::;profile::
IniRead, profile, DotDotDot.ini, Phrases, Profile
Send %profile%
return

::;tk::
IniRead, name, DotDotDot.ini, Phrases, Name
Send %name%
return

::;uid::
IniRead, userId, DotDotDot.ini, Phrases, UserId
Send %userId%
return

::;vn::
Send C:\Dev\Cloud
return

::;zip::
IniRead, zip, DotDotDot.ini, Phrases, Zip
Send %zip%
return


;Sql hotstrings

::;conn::
Send Data Source=.;Initial Catalog=;Integrated Security=False;Uid=sa;Pwd=tyson;
return

::;pgconn::
IniRead, databasePassword, DotDotDot.ini, Phrases, DatabasePassword
Send Host=localhost;Database=environment;Username=postgres;Password=%databasePassword%;Port=5432;
return

::;pgf::
Send CREATE OR REPLACE FUNCTION pg_temp.foo(){Enter}RETURNS SETOF ?{Enter}LANGUAGE plpgsql{Enter}AS $${Enter}DECLARE{Enter 2}BEGIN{Enter}RETURN QUERY ?{Enter}END $$;{Enter 2}SELECT * FROM pg_temp.foo();{Up 3}{Home}{Space 4}
return

::;ssf::
Send SELECT * FROM{Space}
return

::;sf::
Send SELECT  FROM{Space}
Send {Left 6}
return