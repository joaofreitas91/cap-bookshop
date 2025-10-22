using { northwind } from './external/northwind.cds'; 
using { BusinessArea_Read } from './external/BusinessArea_Read.cds'; 
using {bookshop} from '../db/schema';
using {BUSINESS_PARTNER as bp} from './external/BUSINESS_PARTNER';

service BookshopCatalog {
    // @requires: 'authenticated-user'
    entity Books          as projection on bookshop.Books ;
    entity Authors        as projection on bookshop.Authors;
    entity Categories     as projection on bookshop.Categories;
    entity BookCategories as projection on bookshop.BookCategories;
    entity Customers      as projection on bookshop.Customers;
    entity Orders         as projection on bookshop.Orders;
    entity OrderItems     as projection on bookshop.OrderItems;

    function totalAvailableBooks() returns Integer;
    action applyDiscount(bookID: UUID, percent: Integer) returns Books;

    //Extensibility
    entity BusinessPartner as projection on bp.A_BusinessPartner;
}
