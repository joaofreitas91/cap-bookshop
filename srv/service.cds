using {bookshop} from '../db/schema';


service BookshopCatalog {
    entity Books as projection on bookshop.Books;
    entity Authors as projection on bookshop.Authors;
    entity Categories as projection on bookshop.Categories;
    entity BookCategories as projection on bookshop.BookCategories;
}
