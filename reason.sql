SELECT
case p.Reason
when 0 then 'yanlis_numara'
when 1 then 'telefonu_kapatti'
when 2 then 'telefona_cevap_vermedi'
when 3 then 'anket_yapmayi_reddetti'
when 4 then 'diger'
when 5 then 'eksik_numara'
when 6 then 'numara_mesgul'
when 7 then 'telefonu_kapali'
when 9 then 'vatandas/hizmet_bilgisi_hatali'
when 11 then 'yetkili_kisi_yok'
when 13 then 'hat_kesildi'
when 14 then 'musait_degil'
else  'basarili_anket'
end as sonuc_kodu,
count (*) AS sayi
FROM [SYMvePersonelSabimAnket].[dbo].[SGGMPatients]    p WITH (NOLOCK) 
JOIN [SYMvePersonelSabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.CityId
JOIN [SYMvePersonelSabimAnket].[dbo].[AspNetUsers]     a WITH (NOLOCK)  ON p.[CalledById]  = a.[Id]
where p.CallTime > '2020-11-05'
GROUP BY p.Reason
OPTION (maxdop 16)