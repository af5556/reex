SELECT
    r.id AS id,
    r.excluded AS excluded,
    r.iframe AS iframe,
    rs.label AS status,
    r.created_at AS createdAt,
    r.utm_source AS utmSource,
    r.utm_medium AS utmMedium,
    r.utm_campaign AS utmCampaign,
    r.back_link AS backLink,
    r.lead_destination AS leadDestination,
    r.brand_destination AS brandDestination,
    r.device AS device,
    r.id_click AS idClick,
    r.lead_comment AS leadComment,
    r.lead_ind AS sendLead,
    r.send_lead_date AS sendLeadDate,
    r.duplicate_ind as dublicatedLead,
    r.lead_reason_failure as leadReasonFailure,
    r.test AS mode,
    r.uid_c2b AS uidC2b,
    rd.id AS dealerId,
    rd.code_dealer AS codeDealer,
    rd.name AS dealeName,
    rd.zip_code AS dealerZipCode,
    rd.distance AS dealerDistance,
    rd.activity AS dealerActivity,
    rd.manual_dealer AS dealerMode,
    rd.code_dealer_pcadc AS codeDealerPcadc,
    rd.oic_code AS oicCode,
    rd.second_dealer AS secondDealer,
    b.label as template,
    cn.label as country,
    rcn.label as realCountry,
    rpp.type_id as typePurchaseId,
    rpp.type as typePurchase,
    rpp.brand as purchaseBrand,
    rpp.model as purchaseModel,
    rpp.delay as purchaseDelay,
    rpp.bonus as bonus,
    rpp.legal_mention as legalMention,
    rpp.type_bonus as typeBonus,
    rpp.promo_ind as promoInd,
    rpp.promo_id as promoId,
    rpp.promo_gov_ind as promoGovInd,
    rpp.nature_opportunity as natureOpportunity,
    rpp.marketing_code as marketingCode,
    rpp.model_code as modelCode,
    rpp.model_commercial_code as modelCommercialCode,
    va.frevo as frevo,
    va.frevo_stat as frevoStat,
    va.frevo_km as frevoKm,
    va.valid_quotation as validQuotation,
    va.corrected as corrected,
    va.profile as profile,
    va.trade_in as tradeIn,
    va.bid as bid,
    va.internet as quotation,
    va.particular as particular,
    va.quotation_applied as quotationApplied,
    cu.zip_code as customerZipCode,
    cu.phone_number_uid as customerPhoneUid,
    cu.is_test AS test,
    a.optin_1 as optin1,
    a.optin_2 as optin2,
    a.optin_3 as optin3,
    a.optin_4 as optin4,
    vs.general_state_label as generalState,
    v.registration as registration,
    v.registration_month as registrationMonth,
    v.registration_year as registrationYear,
    v.is_interval as isOldCar,
    v.interval_year as intervalOldCar,
    v.brand_label as brand,
    v.model_label as model,
    v.version_label as version,
    v.finish as finish,
    v.mileage as mileage,
    v.engine_power as engine,
    v.kw as kw,
    v.fuel_label as fuel,
    v.body_label as body,
    v.doors as door,
    v.gear_box_label as gear,
    v.color_label as color,
    v.metallic as metallic,
    v.equipment as equipment,
    mt.git_id as gitId,
    mt.creation_date as creationDate,
    ic.brand as interestBrand,
    ic.model as interestModel,
    ic.version as interestVersion,
    ic.gearbox as interestGearbox,
    ic.energy as interestEnergy,
    ic.date_circulation as interestDateOfCirculation,
    ic.mileage as interestMileage,
    ic.selling_price as interestSellingPrice,
    ic.listing_reference as interestListingReference,
    ic.announcement_link as interestAnnouncementLink,
    ic.immat as interestRegistration,
    ic.vin as interestVin,
    mk.market as market,
    mk.campaign_id as campaignId,
    mk.offer_id as offerId,
    mk.level0 as level0,
    mk.level1 as level1,
    mk.level2 as level2,
    mk.level3 as level3,
    mk.level4 as level4,
    mk.fca_language_code as fcaLanguageCode,
    mk.type_cta as typeCta,
    mk.disclaimer_id as disclaimerId,
    mk.business_area as businessArea
FROM
    record AS r
    LEFT JOIN record_dealer rd on r.record_dealer_id = rd.id
    LEFT JOIN middleware_track mt on r.middleware_track_id = mt.id
    LEFT JOIN record_status rs on r.record_status_id = rs.id
    LEFT JOIN vehicle v on r.vehicle_id = v.id
    LEFT JOIN valuation va on r.valuation_id = va.id
    LEFT JOIN record_purchase_project rpp on r.record_purchase_project_id = rpp.id
    LEFT JOIN vehicle_state vs on v.vehicle_state_id = vs.id
    LEFT JOIN site s on r.site_id = s.id
    LEFT JOIN customer cu on r.customer_id = cu.id
    LEFT JOIN agreement a on cu.agreement_id = a.id
    LEFT JOIN country cn on s.country_id = cn.id
    LEFT JOIN country rcn on s.real_country_id = rcn.id
    LEFT JOIN brand b on s.brand_id = b.id
    LEFT JOIN interest_car ic on ic.record_id = r.id
    LEFT JOIN record_master_key mk on mk.record_id = r.id
    WHERE r.created_at BETWEEN "2022-08-01" AND "2022-10-01"