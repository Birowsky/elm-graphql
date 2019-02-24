-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Query exposing (CodeOfConductRequiredArguments, LicenseRequiredArguments, MarketplaceCategoriesOptionalArguments, MarketplaceCategoryRequiredArguments, MarketplaceListingRequiredArguments, MarketplaceListingsOptionalArguments, NodeRequiredArguments, NodesRequiredArguments, OrganizationRequiredArguments, RateLimitOptionalArguments, RepositoryOwnerRequiredArguments, RepositoryRequiredArguments, ResourceRequiredArguments, SearchOptionalArguments, SearchRequiredArguments, TopicRequiredArguments, UserRequiredArguments, codeOfConduct, codesOfConduct, license, licenses, marketplaceCategories, marketplaceCategory, marketplaceListing, marketplaceListings, meta, node, nodes, organization, rateLimit, relay, repository, repositoryOwner, resource, search, searchPaginated, topic, user, viewer)

import Github.Enum.SearchType
import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.ScalarCodecs
import Github.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Internal.Paginator
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.Paginator as Paginator exposing (Direction(..), Paginator)
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)


type alias CodeOfConductRequiredArguments =
    { key : String }


{-| Look up a code of conduct by its key

  - key - The code of conduct's key

-}
codeOfConduct : CodeOfConductRequiredArguments -> SelectionSet decodesTo Github.Object.CodeOfConduct -> SelectionSet (Maybe decodesTo) RootQuery
codeOfConduct requiredArgs object_ =
    Object.selectionForCompositeField "codeOfConduct" [ Argument.required "key" requiredArgs.key Encode.string ] object_ (identity >> Decode.nullable)


{-| Look up a code of conduct by its key
-}
codesOfConduct : SelectionSet decodesTo Github.Object.CodeOfConduct -> SelectionSet (Maybe (List (Maybe decodesTo))) RootQuery
codesOfConduct object_ =
    Object.selectionForCompositeField "codesOfConduct" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


type alias LicenseRequiredArguments =
    { key : String }


{-| Look up an open source license by its key

  - key - The license's downcased SPDX ID

-}
license : LicenseRequiredArguments -> SelectionSet decodesTo Github.Object.License -> SelectionSet (Maybe decodesTo) RootQuery
license requiredArgs object_ =
    Object.selectionForCompositeField "license" [ Argument.required "key" requiredArgs.key Encode.string ] object_ (identity >> Decode.nullable)


{-| Return a list of known open source licenses
-}
licenses : SelectionSet decodesTo Github.Object.License -> SelectionSet (List (Maybe decodesTo)) RootQuery
licenses object_ =
    Object.selectionForCompositeField "licenses" [] object_ (identity >> Decode.nullable >> Decode.list)


type alias MarketplaceCategoriesOptionalArguments =
    { excludeEmpty : OptionalArgument Bool }


{-| Get alphabetically sorted list of Marketplace categories

  - excludeEmpty - Exclude categories with no listings.

-}
marketplaceCategories : (MarketplaceCategoriesOptionalArguments -> MarketplaceCategoriesOptionalArguments) -> SelectionSet decodesTo Github.Object.MarketplaceCategory -> SelectionSet (List decodesTo) RootQuery
marketplaceCategories fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { excludeEmpty = Absent }

        optionalArgs =
            [ Argument.optional "excludeEmpty" filledInOptionals.excludeEmpty Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "marketplaceCategories" optionalArgs object_ (identity >> Decode.list)


type alias MarketplaceCategoryRequiredArguments =
    { slug : String }


{-| Look up a Marketplace category by its slug.

  - slug - The URL slug of the category.

-}
marketplaceCategory : MarketplaceCategoryRequiredArguments -> SelectionSet decodesTo Github.Object.MarketplaceCategory -> SelectionSet (Maybe decodesTo) RootQuery
marketplaceCategory requiredArgs object_ =
    Object.selectionForCompositeField "marketplaceCategory" [ Argument.required "slug" requiredArgs.slug Encode.string ] object_ (identity >> Decode.nullable)


type alias MarketplaceListingRequiredArguments =
    { slug : String }


{-| Look up a single Marketplace listing

  - slug - Select the listing that matches this slug. It's the short name of the listing used in its URL.

-}
marketplaceListing : MarketplaceListingRequiredArguments -> SelectionSet decodesTo Github.Object.MarketplaceListing -> SelectionSet (Maybe decodesTo) RootQuery
marketplaceListing requiredArgs object_ =
    Object.selectionForCompositeField "marketplaceListing" [ Argument.required "slug" requiredArgs.slug Encode.string ] object_ (identity >> Decode.nullable)


type alias MarketplaceListingsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , categorySlug : OptionalArgument String
    , viewerCanAdmin : OptionalArgument Bool
    , adminId : OptionalArgument Github.ScalarCodecs.Id
    , organizationId : OptionalArgument Github.ScalarCodecs.Id
    , allStates : OptionalArgument Bool
    , slugs : OptionalArgument (List (Maybe String))
    , primaryCategoryOnly : OptionalArgument Bool
    , withFreeTrialsOnly : OptionalArgument Bool
    }


{-| Look up Marketplace listings

  - first - Returns the first _n_ elements from the list.

  - after - Returns the elements in the list that come after the specified global ID.

  - last - Returns the last _n_ elements from the list.

  - before - Returns the elements in the list that come before the specified global ID.

  - categorySlug - Select only listings with the given category.

  - viewerCanAdmin - Select listings to which user has admin access. If omitted, listings visible to the
    viewer are returned.

  - adminId - Select listings that can be administered by the specified user.

  - organizationId - Select listings for products owned by the specified organization.

  - allStates - Select listings visible to the viewer even if they are not approved. If omitted or
    false, only approved listings will be returned.

  - slugs - Select the listings with these slugs, if they are visible to the viewer.

  - primaryCategoryOnly - Select only listings where the primary category matches the given category slug.

  - withFreeTrialsOnly - Select only listings that offer a free trial.

-}
marketplaceListings : (MarketplaceListingsOptionalArguments -> MarketplaceListingsOptionalArguments) -> SelectionSet decodesTo Github.Object.MarketplaceListingConnection -> SelectionSet decodesTo RootQuery
marketplaceListings fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, categorySlug = Absent, viewerCanAdmin = Absent, adminId = Absent, organizationId = Absent, allStates = Absent, slugs = Absent, primaryCategoryOnly = Absent, withFreeTrialsOnly = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "categorySlug" filledInOptionals.categorySlug Encode.string, Argument.optional "viewerCanAdmin" filledInOptionals.viewerCanAdmin Encode.bool, Argument.optional "adminId" filledInOptionals.adminId (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapEncoder .codecId), Argument.optional "organizationId" filledInOptionals.organizationId (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapEncoder .codecId), Argument.optional "allStates" filledInOptionals.allStates Encode.bool, Argument.optional "slugs" filledInOptionals.slugs (Encode.string |> Encode.maybe |> Encode.list), Argument.optional "primaryCategoryOnly" filledInOptionals.primaryCategoryOnly Encode.bool, Argument.optional "withFreeTrialsOnly" filledInOptionals.withFreeTrialsOnly Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "marketplaceListings" optionalArgs object_ identity


{-| Return information about the GitHub instance
-}
meta : SelectionSet decodesTo Github.Object.GitHubMetadata -> SelectionSet decodesTo RootQuery
meta object_ =
    Object.selectionForCompositeField "meta" [] object_ identity


type alias NodeRequiredArguments =
    { id : Github.ScalarCodecs.Id }


{-| Fetches an object given its ID.

  - id - ID of the object.

-}
node : NodeRequiredArguments -> SelectionSet decodesTo Github.Interface.Node -> SelectionSet (Maybe decodesTo) RootQuery
node requiredArgs object_ =
    Object.selectionForCompositeField "node" [ Argument.required "id" requiredArgs.id (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias NodesRequiredArguments =
    { ids : List Github.ScalarCodecs.Id }


{-| Lookup nodes by a list of IDs.

  - ids - The list of node IDs.

-}
nodes : NodesRequiredArguments -> SelectionSet decodesTo Github.Interface.Node -> SelectionSet (List (Maybe decodesTo)) RootQuery
nodes requiredArgs object_ =
    Object.selectionForCompositeField "nodes" [ Argument.required "ids" requiredArgs.ids ((Github.ScalarCodecs.codecs |> Github.Scalar.unwrapEncoder .codecId) |> Encode.list) ] object_ (identity >> Decode.nullable >> Decode.list)


type alias OrganizationRequiredArguments =
    { login : String }


{-| Lookup a organization by login.

  - login - The organization's login.

-}
organization : OrganizationRequiredArguments -> SelectionSet decodesTo Github.Object.Organization -> SelectionSet (Maybe decodesTo) RootQuery
organization requiredArgs object_ =
    Object.selectionForCompositeField "organization" [ Argument.required "login" requiredArgs.login Encode.string ] object_ (identity >> Decode.nullable)


type alias RateLimitOptionalArguments =
    { dryRun : OptionalArgument Bool }


{-| The client's rate limit information.

  - dryRun - If true, calculate the cost for the query without evaluating it

-}
rateLimit : (RateLimitOptionalArguments -> RateLimitOptionalArguments) -> SelectionSet decodesTo Github.Object.RateLimit -> SelectionSet (Maybe decodesTo) RootQuery
rateLimit fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { dryRun = Absent }

        optionalArgs =
            [ Argument.optional "dryRun" filledInOptionals.dryRun Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "rateLimit" optionalArgs object_ (identity >> Decode.nullable)


{-| Hack to workaround <https://github.com/facebook/relay/issues/112> re-exposing the root query object
-}
relay : SelectionSet decodesTo RootQuery -> SelectionSet decodesTo RootQuery
relay object_ =
    Object.selectionForCompositeField "relay" [] object_ identity


type alias RepositoryRequiredArguments =
    { owner : String
    , name : String
    }


{-| Lookup a given repository by the owner and repository name.

  - owner - The login field of a user or organization
  - name - The name of the repository

-}
repository : RepositoryRequiredArguments -> SelectionSet decodesTo Github.Object.Repository -> SelectionSet (Maybe decodesTo) RootQuery
repository requiredArgs object_ =
    Object.selectionForCompositeField "repository" [ Argument.required "owner" requiredArgs.owner Encode.string, Argument.required "name" requiredArgs.name Encode.string ] object_ (identity >> Decode.nullable)


type alias RepositoryOwnerRequiredArguments =
    { login : String }


{-| Lookup a repository owner (ie. either a User or an Organization) by login.

  - login - The username to lookup the owner by.

-}
repositoryOwner : RepositoryOwnerRequiredArguments -> SelectionSet decodesTo Github.Interface.RepositoryOwner -> SelectionSet (Maybe decodesTo) RootQuery
repositoryOwner requiredArgs object_ =
    Object.selectionForCompositeField "repositoryOwner" [ Argument.required "login" requiredArgs.login Encode.string ] object_ (identity >> Decode.nullable)


type alias ResourceRequiredArguments =
    { url : Github.ScalarCodecs.Uri }


{-| Lookup resource by a URL.

  - url - The URL.

-}
resource : ResourceRequiredArguments -> SelectionSet decodesTo Github.Interface.UniformResourceLocatable -> SelectionSet (Maybe decodesTo) RootQuery
resource requiredArgs object_ =
    Object.selectionForCompositeField "resource" [ Argument.required "url" requiredArgs.url (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapEncoder .codecUri) ] object_ (identity >> Decode.nullable)


type alias SearchOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


type alias SearchRequiredArguments =
    { query : String
    , type_ : Github.Enum.SearchType.SearchType
    }


{-| Perform a search across resources.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - query - The search string to look for.
  - type\_ - The types of search items to search within.

-}
search : (SearchOptionalArguments -> SearchOptionalArguments) -> SearchRequiredArguments -> SelectionSet decodesTo Github.Object.SearchResultItemConnection -> SelectionSet decodesTo RootQuery
search fillInOptionals requiredArgs object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "search" (optionalArgs ++ [ Argument.required "query" requiredArgs.query Encode.string, Argument.required "type" requiredArgs.type_ (Encode.enum Github.Enum.SearchType.toString) ]) object_ identity


searchPaginated :
    Int
    -> Paginator decodesTo
    -> (SearchOptionalArguments -> SearchOptionalArguments)
    -> SearchRequiredArguments
    -> SelectionSet (List decodesTo) Github.Object.SearchResultItemConnection
    -> SelectionSet (Paginator decodesTo) RootQuery
searchPaginated pageSize paginator fillInOptionals requiredArgs object_ =
    search (fillInOptionals >> Paginator.addPageInfo pageSize paginator)
        requiredArgs
        (Paginator.selectionSet pageSize paginator object_)


type alias TopicRequiredArguments =
    { name : String }


{-| Look up a topic by name.

  - name - The topic's name.

-}
topic : TopicRequiredArguments -> SelectionSet decodesTo Github.Object.Topic -> SelectionSet (Maybe decodesTo) RootQuery
topic requiredArgs object_ =
    Object.selectionForCompositeField "topic" [ Argument.required "name" requiredArgs.name Encode.string ] object_ (identity >> Decode.nullable)


type alias UserRequiredArguments =
    { login : String }


{-| Lookup a user by login.

  - login - The user's login.

-}
user : UserRequiredArguments -> SelectionSet decodesTo Github.Object.User -> SelectionSet (Maybe decodesTo) RootQuery
user requiredArgs object_ =
    Object.selectionForCompositeField "user" [ Argument.required "login" requiredArgs.login Encode.string ] object_ (identity >> Decode.nullable)


{-| The currently authenticated user.
-}
viewer : SelectionSet decodesTo Github.Object.User -> SelectionSet decodesTo RootQuery
viewer object_ =
    Object.selectionForCompositeField "viewer" [] object_ identity
