using {
    cuid,
    managed,
    Country
} from '@sap/cds/common';

using from '@sap/cds-common-content';


namespace bookshop;

entity Books : cuid, managed {
    title           : String(255) not null;
    subtitle        : String(255);
    price           : Integer;
    publicationDate : Date;
    stock           : Integer;
    rating          : Integer;
    available       : Boolean;

    // Relacionamento de 1:1 onde cada livro tem apenas um autor
    author          : Association to one Authors;

    // Relacionamento N:N onde cada livro pode estar relacionado a várias categorias
    // atráves da tabela intermediária BookCategories
    navCategories   : Association to many BookCategories
                          on navCategories.book = $self;
}


entity Authors : cuid, managed {
    firstName : String(255);
    lastName  : String(255);

    //Relacionamento de 1:n onde um author pode estar relacionado a vários livros
    books     : Association to many Books
                    on books.author = $self;
}

entity Categories : cuid, managed {
    name     : String(255);

    // Relacionamento N:N onde um Categoria pode estar relacionada a vários livros
    // atráves da tabela intermediária BookCategories
    navBooks : Association to many BookCategories
                   on navBooks.category = $self;
}

//Entidade intermediária Books x Categories
entity BookCategories : cuid, managed {
    key book     : Association to Books;
    key category : Association to Categories;
}

//aqui abaixo estão as novas entidades
entity Customers : cuid, managed {
    firstName : String(255);
    lastName  : String(255);
    cpf       : String(11);
    phone     : String(11);
    address   : String(255);
    city      : String(255);
    state     : String(255);
    country   : Country;
    cep       : String(8);

    orders    : Association to many Orders
                    on orders.customer = $self
}

entity Orders : cuid, managed {
    key     ID         : UUID;
            OrderDate  : DateTime;
    virtual totalValue : Integer;
            status     : String(20); /* “PENDING”, “PAID”, “CANCELLED” */

            customer   : Association to one Customers;

            orderItems : Composition of many OrderItems
                             on orderItems.order = $self
}

entity OrderItems : cuid, managed {
    quantity : Integer;
    order    : Association to one Orders;
    book     : Association to one Books;
}
