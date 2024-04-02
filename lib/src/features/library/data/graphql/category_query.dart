import '__generated__/category_query.req.gql.dart';

abstract class CategoryQuery {
  static GAllCategoriesReq getAllCategories() =>
      GAllCategoriesReq()..vars.condition;
}
