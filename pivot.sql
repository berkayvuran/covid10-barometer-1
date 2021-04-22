SELECT 
p.[Id] AS id,
c.[Name] AS sehir,
case p.Gender 
when 1 then 'kadin' 
when 2 then 'erkek'
else 'Error' end as cinsiyet,
p.[RuleSurveyCount] AS yapilmasi_gereken_anket,
p.[LeftSurveyCount] AS kalan_anket,
case p.[Environment]
WHEN 1 THEN 'asil'
WHEN 2 THEN 'pilot'
ELSE 'hata' END AS calisma_turu,
case p.[IsActive]
WHEN 1 THEN 'evet'
WHEN 0 THEN 'hayir'
ELSE 'Error' END AS aktif_mi
FROM [SYMvePersonelSabimAnket].[dbo].[SGGMSurveyRules] p
JOIN [SYMvePersonelSabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.CityId
WHERE p.Environment=1 and
p.LeftSurveyCount	<= 0 --AND p.IsActive	= 1
ORDER BY c.Name ASC
OPTION (maxdop 16)

SELECT 
p.[Id] AS id,
c.[Name] AS sehir,
case p.Gender 
when 1 then 'kadin' 
when 2 then 'erkek'
else 'Error' end as cinsiyet,
p.[RuleSurveyCount] AS yapilmasi_gereken_anket,
p.[LeftSurveyCount] AS kalan_anket,
case p.[Environment]
WHEN 1 THEN 'asil'
WHEN 2 THEN 'pilot'
ELSE 'hata' END AS calisma_turu,
case p.[IsActive]
WHEN 1 THEN 'evet'
WHEN 0 THEN 'hayir'
ELSE 'Error' END AS aktif_mi
FROM [SYMvePersonelSabimAnket].[dbo].[SGGMSurveyRules] p
JOIN [SYMvePersonelSabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.CityId
WHERE p.IsActive = 1 AND
p.Environment = 1
ORDER BY c.Name ASC
OPTION (maxdop 16)
SELECT c.Name,case s.Gender when 1 then 'Kadýn' else 'Erkek' END Cinsiyet,count(*) [Kalan Anket] FROM dbo.SGGMPatients s
 JOIN 
 (
SELECT sr.CityId ,sr.Gender FROM dbo.SGGMSurveyRules sr
WHERE sr.IsActive=1 AND sr.Environment=1
) klm ON klm.CityId=s.CityId AND klm.Gender=s.Gender
JOIN dbo.Cities c ON s.CityId = c.Id
WHERE s.Status=0
GROUP BY c.Name,s.Gender