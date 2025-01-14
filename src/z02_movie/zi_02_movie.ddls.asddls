@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'movie'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_02_Movie as select from ZR_02_Movie

association [0..1] to ZI_02_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid



composition [0..*] of ZI_02_Rating as _Ratings






{
  key MovieUuid,
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  _AverageRating.AverageRating as AverageRating,
  case when $projection.AverageRating > 6.7 then 3
  when $projection.AverageRating > 3.4 then 2
  when $projection.AverageRating > 0 then 1
  else 0
  end as AverageRatingCriticality,
  _Ratings
   // Make association public
}
