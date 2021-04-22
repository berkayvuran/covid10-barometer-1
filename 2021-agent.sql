--anketor bazli cagri sayisi
SELECT
coalesce(a.Email,'Toplam') AS anketor_e_posta,
count (*) AS cagri_sayisi
FROM [SYMvePersonelSabimAnket].[dbo].[SGGMPatients]    p WITH (NOLOCK) 
JOIN [SYMvePersonelSabimAnket].[dbo].[SGGMSurveyRules] s WITH (NOLOCK)  ON s.CityId = p.CityId AND s.Gender = p.Gender AND s.Environment=1
JOIN [SYMvePersonelSabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.CityId
JOIN [SYMvePersonelSabimAnket].[dbo].[AspNetUsers]     a WITH (NOLOCK)  ON p.[CalledById]  = a.[Id]
where p.CallTime > '2021-03-16 08:00:00.000'
AND p.CallTime	< '2021-03-16 20:00:00.000'
AND a.Email LIKE '%pusula%' AND a.Email NOT LIKE '%eroksuz%'
GROUP BY cube (a.Email)
order by a.email asc
OPTION (maxdop 16)
--anketor bazli anket sayisi
SELECT
coalesce(a.Email,'Toplam') AS anketor_e_posta,
count (*) AS anket_sayisi
FROM [SYMvePersonelSabimAnket].[dbo].[SGGMPatients]    p WITH (NOLOCK) 
JOIN [SYMvePersonelSabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.CityId
JOIN [SYMvePersonelSabimAnket].[dbo].[AspNetUsers]     a WITH (NOLOCK)  ON p.[CalledById]  = a.[Id]
where p.CallTime > '2021-03-16 08:00:00.000'
AND p.CallTime	< '2021-03-16 20:00:00.000'
AND a.Email LIKE '%pusula%' AND a.Email NOT LIKE '%eroksuz%'
AND p.STATUS = 1
AND p.Reason IS NULL
GROUP BY cube (a.Email)
order by a.email asc
OPTION (maxdop 16)

