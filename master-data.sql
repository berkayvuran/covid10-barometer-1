SELECT 
p.Phone AS telefon_numarasi,
p.[Id] AS vatandas_id,
a.[Name] + ' ' + a.[Surname] as anketor,
a.[Email] as anketor_e_posta_adresi,
p.CallTime AS anket_gunu,
case p.Gender
when 1 then 'kadin' 
when 0 then 'erkek'
when 2 then 'erkek'
else 'hata' end as cinsiyet,
p.Age AS yas,
case 
when p.Age < 18  then '0_17'
when 18 <= p.Age and  p.Age < 25  then '18_24'
when 25 <= p.Age and  p.Age < 35  then '25_34'
when 35 <= p.Age and  p.Age < 45  then '35_44'
when 45 <= p.Age and  p.Age < 55  then '45_54'
when 55 <= p.Age and  p.Age < 65  then '55_64'
when  p.Age >= 65  then '65+'
else 'hata'
end as yas_grubu,
c.[Name] as sehir,
case  p.[status]
when 1 then 'basarili'
when 2 then 'askida'
when 3 then 'islemde'
when 0 then 'yeni_veri'
when 4 then 'basarisiz'
else 'hata' end as anket_durumu,
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
p.Description AS aciklama
FROM [SYMvePersonelSabimAnket].[dbo].[SGGMPatients]    p WITH (NOLOCK) 
JOIN [SYMvePersonelSabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.CityId
JOIN [SYMvePersonelSabimAnket].[dbo].[AspNetUsers]     a WITH (NOLOCK)  ON p.[CalledById]  = a.[Id]
where p.CallTime > '2020-11-06'
AND p.Reason = 0
ORDER BY p.[CallTime] ASC
OPTION (maxdop 16)
