
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer kpi'


define view entity ZI_02_CustomerKPIs as select from Z02_I_TravelWithCustomer
{
  
  key CustomerId,
  
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(TotalPrice+BookingFee) as TotalRevenue,
  CurrencyCode,
  
  
  
  avg(Duration as abap.dec( 16, 0 )) as AverageDuration,
  
  count(distinct AgencyId) as NumberOfDifferentAgencys
  
  
  
  
  
  
  
}
group by CustomerId,
  CurrencyCode


having  sum(TotalPrice+BookingFee)>= 50000
