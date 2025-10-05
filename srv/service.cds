using {bookshop} from '../db/schema';


service BookshopCatalog {
    entity Books as projection on bookshop.Books;
}
