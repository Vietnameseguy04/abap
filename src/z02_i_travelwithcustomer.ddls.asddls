
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travelwith_Customer'


define view entity Z02_I_TravelWithCustomer as select from ZI_02_Customer

inner join ZI_02_Travel on ZI_02_Customer.CustomerId = ZI_02_Travel.CustomerId
 




{
  key ZI_02_Travel.TravelId,

      ZI_02_Travel.AgencyId,
      ZI_02_Travel.BeginDate,
      ZI_02_Travel.EndDate,
      dats_days_between(ZI_02_Travel.BeginDate, ZI_02_Travel.EndDate) as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => ZI_02_Travel.BookingFee,
                          source_currency    => ZI_02_Travel.CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => ZI_02_Travel.BeginDate,
                          error_handling     => 'KEEP_UNCONVERTED')   as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => ZI_02_Travel.TotalPrice,
                          source_currency    => ZI_02_Travel.CurrencyCode,
                          target_currency    => $projection.CurrencyCode,
                          exchange_rate_date => ZI_02_Travel.BeginDate,
                          error_handling     => 'KEEP_UNCONVERTED')   as TotalPrice,

      cast('EUR' as abap.cuky)                                        as CurrencyCode,

      ZI_02_Travel.Description,
      ZI_02_Travel.Status,
      ZI_02_Customer.CustomerId,

      case when ZI_02_Customer.Title = 'Mr.' or ZI_02_Customer.Title = 'Mrs.'
          then
            concat_with_space(ZI_02_Customer.Title,
                              concat_with_space(ZI_02_Customer.FirstName, ZI_02_Customer.LastName, 1),
                              1)
        else
            concat_with_space(ZI_02_Customer.FirstName,
                              ZI_02_Customer.LastName,
                              1)
      end                                                             as CustomerName,

      ZI_02_Customer.FirstName,
      ZI_02_Customer.LastName,
      ZI_02_Customer.Title,
      ZI_02_Customer.Street,
      ZI_02_Customer.PostalCode,
      ZI_02_Customer.City
}

where ZI_02_Customer.CountryCode = 'DE'
