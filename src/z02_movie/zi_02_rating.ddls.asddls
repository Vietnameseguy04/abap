@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'rating'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_02_Rating as select from ZR_02_Rating
association to parent ZI_02_Movie as _Movie
  on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  _Movie // Make association public
}
