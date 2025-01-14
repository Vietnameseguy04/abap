
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds07'


define view entity ZI_02_CustomerWithTravels as select from ZI_02_Customer

association [0..*]  to ZI_02_Travel as _Travels on ZI_02_Customer.CustomerId = _Travels.CustomerId




{
key ZI_02_Customer.CustomerId,
ZI_02_Customer.FirstName,
ZI_02_Customer.LastName,
ZI_02_Customer.Title,
ZI_02_Customer.Street,
ZI_02_Customer.PostalCode,
ZI_02_Customer.City,
ZI_02_Customer.CountryCode,

_Travels
 
}
