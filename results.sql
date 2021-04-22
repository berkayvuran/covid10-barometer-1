SELECT
ss.Id AS anket_id,
s.Id,
s.phone,
anu.[Name] + ' ' + anu.[Surname] as anketor,
anu.[Email] as anketor_e_posta_adresi,
CretateDate AS anket_gunu,
convert(char, ss.CretateDate - s.CallTime, 108) AS anket_suresi,
case s.Gender
when 1 then 'kadin' 
when 0 then 'erkek'
when 2 then 'erkek'
else 'hata' end as cinsiyet,
s.Age AS yas,
case 
when s.Age < 18  then '0_17'
when 18 <= s.Age and  s.Age < 25  then '18_24'
when 25 <= s.Age and  s.Age < 35  then '25_34'
when 35 <= s.Age and  s.Age < 45  then '35_44'
when 45 <= s.Age and  s.Age < 55  then '45_54'
when 55 <= s.Age and  s.Age < 65  then '55_64'
when s.Age >= 65  then '65+'
else 'hata'
end as yas_grubu,
c.Name AS kayitli_sehir,
lul50.Name AS beyan_edilen_sehir,
lul48.Name AS yasanilan_yer,
lul49.Name AS oturdugunuz_ev,
lul.Name AS ogrenim_durumu,
lul2.Name AS medeni_durum,
lul3.Name AS cocuk_durumu,
ISNULL (ss.HowManyChildrenId,999999) AS cocuk_sayisi,
ISNULL (lul4.Name,999999) AS okula_giden_cocuk,
lul5.Name AS okullarin_acilmasi,
lul52.Name AS okuldan_covid,
ss.NumberofPeopleintheHouseId AS yasayan_kisi,
ss.MonthlyIncomeId AS aylik_gelir,
lul53.Name AS gelir_degisimi,
lul51.Name AS meslek,
lul6.Name AS insanlarin_guvenilirligi,
lul7.Name AS hayattan_memnuniyet,
lul8.Name AS sagliktan_memnuniyet,
lul9.Name AS pandemi_donemi_hayattan_memnuniyet,
lul10.Name AS koronavirusun_ortaya_cikmasi,
lul11.Name AS koronavirus_haberleri_takip,
lul12.Name AS toplumsal_dayanisma,
lul13.Name AS komsuluk_iliskileri,
lul14.Name AS akrabalik_iliskileri,
lul15.Name AS sozel_siddet,
lul16.Name AS fiziksel_siddet,
lul17.Name AS size_yonelik_sozel_siddet,
lul18.Name AS size_yonelik_fiziksel_siddet,
lul19.Name AS tavsiye_ve_uyarilara_uyma,
lul20.Name AS sosyal_mesafe,
lul21.Name AS maske_kurallari,
ISNULL(slc.selection,'Mesafeye uyuluyor') mesafeye_uymama_sebebi,
lul22.Name AS toplu_tasima,
ISNULL(lul23.Name, 'Toplu taþýma kullanmýyor') AS toplu_tasima_sikligi,
lul24.Name AS virusle_mucadeleden_memnuniyet,
lul27.Name AS saglik_bakanina_guven,
lul26.Name AS doktorlara_uzmanlara_guven,
lul28.Name AS devlete_guven,
lul29.Name AS bilim_kuruluna_guven,
lul30.Name AS saglik_bakanligina_guven,
lul32.Name AS salginla_mucadele_kiyaslama,
lul33.Name AS koronavirus_sonrasi_is_hayati,
lul34.Name AS genelde_mutluluk,
lul35.Name AS toplu_tasimayla_seyahat_eden_aile_bireyi,
lul36.Name AS maske_temininde_zorluk,
lul37.Name AS kronik_hastalik,
lul38.Name AS buyuk_guclerin_komplosu,
lul39.Name AS kalabalikta_maske,
lul40.Name AS sosyal_mesafe,
lul41.Name AS temizlik_kurallari,
lul42.Name AS cevrede_hastalanan,
lul43.Name AS yasal_zorunluluk,
lul44.Name AS hastalanacagini_dusunme,
lul45.Name AS kolayca_atlatma,
lul46.Name AS temel_ihtiyac,
lul54.Name AS yakin_is,
lul55.Name AS yakin_bulunma,
lul56.Name AS yakin_is_temas,
lul57.Name AS yakin_bulunma_temas,
lul58.Name AS yakin_kaybetme_korkusu,
lul59.Name AS olum_korkusu,
lul60.Name AS virus_kapma_korkusu,
lul61.Name AS fiziksel_yakinlik_calisma,
lul47.Name AS politik_yelpaze,
ss.Description AS aciklama
FROM [SYMvePersonelSabimAnket].[dbo].SGGMPatients s
JOIN [SYMvePersonelSabimAnket].[dbo].Cities c			WITH (NOLOCK) ON s.CityId = c.Id
JOIN [SYMvePersonelSabimAnket].[dbo].SurveySGGMs ss		WITH (NOLOCK) ON ss.PatientId = s.Id
LEFT JOIN (
SELECT sso.SurveySGGMId,STRING_AGG( lul.Name,', ')  WITHIN GROUP (ORDER BY lul.DisplayOrder DESC) selection FROM dbo.SurveySGGMs ss
JOIN dbo.SurveySGGMSelectOptions sso ON ss.Id = sso.SurveySGGMId
JOIN dbo.LookUpLists  lul ON lul.Id=sso.LookUpListId
GROUP BY sso.SurveySGGMId
)
 slc ON slc.SurveySGGMId=ss.Id
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul	WITH (NOLOCK) ON lul.Id = ss.EducationalStatusId
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul2	WITH (NOLOCK) ON lul2.Id = ss.MaritalStatusId
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul3	WITH (NOLOCK) ON lul3.Id = ss.HaveChildrenId
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul5	WITH (NOLOCK) ON lul5.Id = ss.[SchoolsOpeningId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul6	WITH (NOLOCK) ON lul6.Id = ss.[PeopleReliableId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul7	WITH (NOLOCK) ON lul7.Id = ss.[HowSatisfiedinLifeId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul8	WITH (NOLOCK) ON lul8.Id = ss.[HowSatisfiedinHealthId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul9	WITH (NOLOCK) ON lul9.Id = ss.[HowSatisfiedinLifeAfterEpidemicId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul10	WITH (NOLOCK) ON lul10.Id = ss.[HowCoronaVirusOccursId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul11	WITH (NOLOCK) ON lul11.Id = ss.[CoronaVirusNewsFollowId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul12	WITH (NOLOCK) ON lul12.Id = ss.[HowSocialSolidarityChangedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul13	WITH (NOLOCK) ON lul13.Id = ss.[NeighbourhoodRelationshipsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul14	WITH (NOLOCK) ON lul14.Id = ss.[SolidarityBetweenRelativesId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul15	WITH (NOLOCK) ON lul15.Id = ss.[VerbalViolenceEnvironmentId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul16	WITH (NOLOCK) ON lul16.Id = ss.[PhysicalViolenceEnvironmentId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul17	WITH (NOLOCK) ON lul17.Id = ss.[VerbalViolenceYourselfId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul18	WITH (NOLOCK) ON lul18.Id = ss.[PhysicalViolenceYourselfId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul19	WITH (NOLOCK) ON lul19.Id = ss.[HowMuchCoronoVirusObeyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul20	WITH (NOLOCK) ON lul20.Id = ss.[HowMuchsocialDistancingObeyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul21	WITH (NOLOCK) ON lul21.Id = ss.[HowMuchMaskRulesObeyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul22	WITH (NOLOCK) ON lul22.Id = ss.[PublicTransportationUseId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul24	WITH (NOLOCK) ON lul24.Id = ss.[CoronaVirusFightSatisfactionId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul26	WITH (NOLOCK) ON lul26.Id = ss.[ToDoctors_ExpertsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul27	WITH (NOLOCK) ON lul27.Id = ss.[TotheMinisterofHealthId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul28	WITH (NOLOCK) ON lul28.Id = ss.[TotheStateId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul29	WITH (NOLOCK) ON lul29.Id = ss.[TotheScientificCommitteeId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul30	WITH (NOLOCK) ON lul30.Id = ss.[ToCoronavirusNewsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul32	WITH (NOLOCK) ON lul32.Id = ss.[FighttheEpidemicId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul33	WITH (NOLOCK) ON lul33.Id = ss.[TheEmergenceoftheCoronavirusId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul34	WITH (NOLOCK) ON lul34.Id = ss.[HappyPersonId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul35	WITH (NOLOCK) ON lul35.Id = ss.[FamilyForcedToTravelId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul36	WITH (NOLOCK) ON lul36.Id = ss.[ProvidingaMaskId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul37	WITH (NOLOCK) ON lul37.Id = ss.[AChronicHealthId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul38	WITH (NOLOCK) ON lul38.Id = ss.[AConspiracyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul39	WITH (NOLOCK) ON lul39.Id = ss.[CrowdedPlaceId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul40	WITH (NOLOCK) ON lul40.Id = ss.[KeeptheDistanceId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul41	WITH (NOLOCK) ON lul41.Id = ss.[CleaningRulesId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul42	WITH (NOLOCK) ON lul42.Id = ss.[ImmediateEnvironmentId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul43	WITH (NOLOCK) ON lul43.Id = ss.[LegalObligationId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul44	WITH (NOLOCK) ON lul44.Id = ss.[ThinksCaughtId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul45	WITH (NOLOCK) ON lul45.Id = ss.[GetOverEasilyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul46	WITH (NOLOCK) ON lul46.Id = ss.[BasicNeedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul47	WITH (NOLOCK) ON lul47.Id = ss.[PoliticalFanId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul48	WITH (NOLOCK) ON lul48.Id = ss.[WhereLiveNowId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul49	WITH (NOLOCK) ON lul49.Id = ss.[WhatTypeofHouseId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul50	WITH (NOLOCK) ON lul50.Id = ss.[WhichCityId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul51	WITH (NOLOCK) ON lul51.Id = ss.[WhatisYourJobId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul52	WITH (NOLOCK) ON lul52.Id = ss.[SchoolCovidId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul53	WITH (NOLOCK) ON lul53.Id = ss.[SalaryChangeId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul54	WITH (NOLOCK) ON lul54.Id = ss.[CloseWorkId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul55	WITH (NOLOCK) ON lul55.Id = ss.[ClosePlaceId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul56	WITH (NOLOCK) ON lul56.Id = ss.[CloseWorkEncounterId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul57	WITH (NOLOCK) ON lul57.Id = ss.[ClosePlaceEncounterId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul58	WITH (NOLOCK) ON lul58.Id = ss.[FearOfLossId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul59	WITH (NOLOCK) ON lul59.Id = ss.[FearOfDeathId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul60	WITH (NOLOCK) ON lul60.Id = ss.[FearOfCovidId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul61	WITH (NOLOCK) ON lul61.Id = ss.[FamilyAffinityId]
JOIN [SYMvePersonelSabimAnket].[dbo].AspNetUsers anu WITH (NOLOCK) ON anu.Id = s.CalledById
LEFT JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul4	WITH (NOLOCK) ON lul4.Id = ss.[PrimaryEducationId]
LEFT JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul23	WITH (NOLOCK) ON lul23.Id = ss.[PublicTransportationUseFrequencyId]
where s.CallTime > '2020-11-04'
--AND anu.email LIKE '%avsar%'
ORDER BY ss.Id ASC
OPTION (maxdop 16)