
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ave'


define view entity ZI_02_AverageRating as select from ZI_02_Rating
{

key MovieUuid,

@EndUserText.label: 'AverageRating'
@EndUserText.quickInfo: 'AverageRating'
  avg(Rating as abap.dec( 4, 1 )) as AverageRating
}
group by 
MovieUuid
