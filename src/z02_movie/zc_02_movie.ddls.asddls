@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_02_movie
  provider contract transactional_query as projection on ZI_02_Movie
{
  key MovieUuid,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.5
  
  Title,
  @Consumption.valueHelpDefinition: [{entity: { name: 'ZI_02_GenreVH', element: 'Genre'} } ]
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  AverageRating,
  AverageRatingCriticality,
  
  _Ratings:  redirected to composition child ZC_02_Rating
}
