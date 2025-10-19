using {BusinessPartner} from './external/BusinessPartner.cds';
using {bookshop} from '../db/schema';

// @requires: 'authenticated-user'
service BookshopCatalog {
    entity Books             as projection on bookshop.Books;
    entity Authors           as projection on bookshop.Authors;
    entity Categories        as projection on bookshop.Categories;
    entity BookCategories    as projection on bookshop.BookCategories;
    entity Customers         as projection on bookshop.Customers;
    entity A_BusinessPartner as projection on BusinessPartner.A_BusinessPartner;

    @requires: 'authenticated-user'
    entity Orders            as projection on bookshop.Orders;

    entity OrderItems        as projection on bookshop.OrderItems;

    function totalAvailableBooks()                         returns Integer;
    action   applyDiscount(bookID: UUID, percent: Integer) returns Books;
}
