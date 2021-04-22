SELECT
ss.Id AS c2_anket_id,
s.Phone AS telefon_no,
anu.[Email] as c2_anketor,
ss.CretateDate AS c2_anket_gunu,
convert(char, ss.CretateDate - s.CallTime, 108) AS c2_anket_suresi,
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
c.Name AS sehir,
lul.Name AS c2_ogrenim_durumu,
lul2.Name AS c2_medeni_durum,
lul3.Name AS c2_cocuk_durumu,
ss.[HowManyChildrenId] AS c2_cocuk_sayisi,
lul5.Name AS c2_okula_giden_cocuk,
lul62.Name AS y_c2_online_egitim_verimlilik,
lul63.Name AS y_c2_ilkogretim_acilmasi,
lul64.name AS y_c2_ortaogretim_acilmasi,
lul65.name AS y_c2_yuksekogretim_acilmasi,
lul66.name AS y_c2_isler_nereden,
ss.[MonthlyIncomeId] AS c2_aylik_gelir_tl,
case
WHEN ss.MonthlyIncomeId = 0 THEN 'Belirtmek istemedi'
when ss.[MonthlyIncomeId] <= 2000  then '2000TL ve Altý'
when 2001 <= ss.[MonthlyIncomeId] and  ss.[MonthlyIncomeId] <= 3500  then '2001TL-3500TL Arasý'
when 3501 <= ss.[MonthlyIncomeId] and  ss.[MonthlyIncomeId] <= 5000  then '3501TL-5000TL Arasý'
when 5001 <= ss.[MonthlyIncomeId] and  ss.[MonthlyIncomeId] <= 6500  then '5001TL-6500TL Arasý'
when 6501 <= ss.[MonthlyIncomeId] and  ss.[MonthlyIncomeId] <= 8000  then '6501TL-8000TL Arasý'
when ss.[MonthlyIncomeId] >= 8001  then '8001TL ve Üstü'
else 'hata'
end as c2_aylik_gelir,
lul53.Name AS c2_gelir_degisimi,
lul51.Name AS c2_meslek,
lul6.Name AS c2_insanlarin_guvenilirligi,
lul7.Name AS c2_hayattan_memnuniyet,
lul67.name AS y_c2_saglik_korunmasi,
lul10.Name AS c2_koronavirusun_ortaya_cikmasi,
lul68.name as y_c2_aile_bagi,
lul69.name as y_c2_aile_guven,
lul70.name as y_c2_aile_maddi_destek,
lul71.name as y_c2_aile_iletisim_sorunu,
lul72.name as y_c2_aile_ici_siddet,
lul73.name as y_c2_hazir_birikim,
lul74.name as y_c2_borcla_idare,
lul75.name as y_c2_kisitlamalar,
lul76.name as y_c2_kafe_restoran,
lul77.name as c2_koronavirus_sonrasi_is_hayati,
lul27.Name AS c2_saglik_bakanina_guven,
lul26.Name AS c2_doktorlara_uzmanlara_guven,
lul28.Name AS c2_devlete_guven,
lul30.Name AS c2_saglik_bakanligina_guven,
lul78.Name AS y_c2_covid19_gecirdi_mi,
lul79.Name AS y_c2_ailede_covid19,
lul80.name as c2_komplo,
lul81.name as c2_kolayca_atlatma,
lul82.name as y_c2_gecimde_zorluk,
lul83.name as c2_temel_ihtiyaclar,
lul84.name as y_c2_cevrede_ilac_kullanmayan,
lul85.name as y_c2_ilac_kullanma,
lul86.name as y_c2_alternatif_tip,
lul87.name as c2_sevdiklerini_kaybetme,
lul88.name as c2_olum_korkusu,
lul89.name as c2_virus_kapma_korkusu,
lul90.name as y_c2_yalnizlik_duygusu,
lul91.name as y_c2_fiziksel_yakinlik,
lul92.name as y_c2_6_ay_ekonomi,
lul93.name as y_c2_hastaligi_nasil_gecirdiniz,
ss.[WhoIsPassingById] as y_c2_hastalik_kimden,
ss.[WhereGetCovidId] AS y_c2_hastalik_nereden,
lul96.name as y_c2_asi_durumu,
ss.[WhyNotVaccinatedId] AS y_c2_asi_istememe_nedeni,
lul98.name as y_c2_asi_haberleri,
lul99.name as y_c2_yan_etkisiz_asi,
lul100.name as y_c2_ulke_fark_etmez,
lul101.name as y_c2_yan_etki_endisesi,
lul102.name as y_c2_hastalansa_da_asi,
lul103.name as y_c2_hicbir_asiya_guven,
lul104.name as y_c2_asiya_karsi,
lul105.name as y_c2_asiya_inanc,
lul106.name as y_c2_sagliksiz_yan_etki,
lul107.name as y_c2_kendi_kendine_iyilesecek,
lul108.name as y_c2_suru_bagisikligi,
lul109.name as y_c2_asi_yeni,
lul110.name as y_c2_asi_gorus,
ss.Description AS c2_aciklama
FROM [SYMvePersonelSabimAnket].[dbo].SGGMPatients s
JOIN [SYMvePersonelSabimAnket].[dbo].Cities c			WITH (NOLOCK) ON s.CityId = c.Id
JOIN [SYMvePersonelSabimAnket].[dbo].[SurveySGGMVaccinated2] ss		WITH (NOLOCK) ON ss.PatientId = s.Id
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul	WITH (NOLOCK) ON lul.Id = ss.[EducationalStatusId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul2	WITH (NOLOCK) ON lul2.Id = ss.MaritalStatusId
left JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul3	WITH (NOLOCK) ON lul3.Id = ss.HaveChildrenId
left JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul4	WITH (NOLOCK) ON lul4.Id = ss.[HowManyChildrenId]
left JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul5	WITH (NOLOCK) ON lul5.Id = ss.[WhoChildrenId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul6	WITH (NOLOCK) ON lul6.Id = ss.[PeopleReliableId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul7	WITH (NOLOCK) ON lul7.Id = ss.[HowSatisfiedinLifeId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul10	WITH (NOLOCK) ON lul10.Id = ss.[HowCoronaVirusOccursId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul27	WITH (NOLOCK) ON lul27.Id = ss.[TotheMinisterofHealthId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul26	WITH (NOLOCK) ON lul26.Id = ss.[ToDoctorsExpertsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul28	WITH (NOLOCK) ON lul28.Id = ss.[TotheStateId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul30	WITH (NOLOCK) ON lul30.Id = ss.[ToMinistryofHealthId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul51	WITH (NOLOCK) ON lul51.Id = ss.[WhatisYourJobId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul53	WITH (NOLOCK) ON lul53.Id = ss.[SalaryChangeId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul62	WITH (NOLOCK) ON lul62.Id = ss.[EfficiencyeEducationId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul63	WITH (NOLOCK) ON lul63.Id = ss.[ThinkingOpeningPrimarySchoolId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul64	WITH (NOLOCK) ON lul64.Id = ss.[ThinkingOpeningMiddleSchoolId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul65	WITH (NOLOCK) ON lul65.Id = ss.[ThinkingOpeningUniversitySchoolId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul66	WITH (NOLOCK) ON lul66.Id = ss.[whereDoWorkId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul67	WITH (NOLOCK) ON lul67.Id = ss.[WhatProtectHealthId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul68	WITH (NOLOCK) ON lul68.Id = ss.[GetFamilyTiesStrongerId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul69	WITH (NOLOCK) ON lul69.Id = ss.[TrustFamilyMembersIncreasedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul70	WITH (NOLOCK) ON lul70.Id = ss.[SupportFamilyMembersId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul71	WITH (NOLOCK) ON lul71.Id = ss.[IncreaseFamilyCommunicationId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul72	WITH (NOLOCK) ON lul72.Id = ss.[IncreaseDomesticViolenceId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul73	WITH (NOLOCK) ON lul73.Id = ss.[ConsumingReadySavingsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul74	WITH (NOLOCK) ON lul74.Id = ss.[DealingWithDebtId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul75	WITH (NOLOCK) ON lul75.Id = ss.[Covid19RestrictionsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul76	WITH (NOLOCK) ON lul76.Id = ss.[OpeningCafesRestaurantsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul77	WITH (NOLOCK) ON lul77.Id = ss.[ChangeInBusinessLifeId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul78	WITH (NOLOCK) ON lul78.Id = ss.[HasCovid19Id]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul79	WITH (NOLOCK) ON lul79.Id = ss.[HasCovid19InFamilyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul80	WITH (NOLOCK) ON lul80.Id = ss.[Covid19BigPowerId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul81	WITH (NOLOCK) ON lul81.Id = ss.[RecoveryEasilyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul82	WITH (NOLOCK) ON lul82.Id = ss.[DifficultyLivingId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul83	WITH (NOLOCK) ON lul83.Id = ss.[BasicNeedDifficultyLivingId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul84	WITH (NOLOCK) ON lul84.Id = ss.[NotUseMedicationId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul85	WITH (NOLOCK) ON lul85.Id = ss.[ThinkingUsingMedicationId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul86	WITH (NOLOCK) ON lul86.Id = ss.[MoreAlternativeMedicineId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul87	WITH (NOLOCK) ON lul87.Id = ss.[LosingLovedOnesId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul88	WITH (NOLOCK) ON lul88.Id = ss.[FearofDeathId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul89	WITH (NOLOCK) ON lul89.Id = ss.[FearofGettingVirusesId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul90	WITH (NOLOCK) ON lul90.Id = ss.[IncreaseSenseofLonelinessId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul91	WITH (NOLOCK) ON lul91.Id = ss.[RequiresPhysicalProximityId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul92	WITH (NOLOCK) ON lul92.Id = ss.[EconomicStatusIn6MonthsId]
left JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul93	WITH (NOLOCK) ON lul93.Id = ss.[HowIsPassingCovidId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul96	WITH (NOLOCK) ON lul96.Id = ss.[HaveVaccinatedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul98	WITH (NOLOCK) ON lul98.Id = ss.[FollowNewsFrequentlyId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul99	WITH (NOLOCK) ON lul99.Id = ss.[ProofofSideEffectsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul100	WITH (NOLOCK) ON lul100.Id = ss.[WhichCountryProducingId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul101	WITH (NOLOCK) ON lul101.Id = ss.[WorriedAboutSideEffectsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul102	WITH (NOLOCK) ON lul102.Id = ss.[WantToVaacinatedAlwaysId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul103	WITH (NOLOCK) ON lul103.Id = ss.[TrustAnyVaccinatedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul104	WITH (NOLOCK) ON lul104.Id = ss.[AgainstVaccinatedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul105	WITH (NOLOCK) ON lul105.Id = ss.[DefeatVaccinatedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul106	WITH (NOLOCK) ON lul106.Id = ss.[ThinkSideEffectsId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul107	WITH (NOLOCK) ON lul107.Id = ss.[ThinkGoAwayonOwnId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul108	WITH (NOLOCK) ON lul108.Id = ss.[BetterAfterVaccinatedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul109	WITH (NOLOCK) ON lul109.Id = ss.[HowAffectedAfterVaccinatedId]
JOIN [SYMvePersonelSabimAnket].[dbo].LookUpLists lul110	WITH (NOLOCK) ON lul110.Id = ss.[OpiniononVaccineId]
JOIN [SYMvePersonelSabimAnket].[dbo].AspNetUsers anu WITH (NOLOCK) ON anu.Id = s.CalledById
WHERE anu.email LIKE '%pusula%' AND anu.email NOT LIKE '%dilek.erok%'
--s.phone = '%5354071749%
ORDER BY ss.Id ASC
OPTION (maxdop 16)

