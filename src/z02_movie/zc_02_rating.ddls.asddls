@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'rating'

@Metadata.allowExtensions: true
define view entity ZC_02_Rating as projection on ZI_02_Rating
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  /* Associations */
  _Movie: redirected to parent ZC_02_movie
}
