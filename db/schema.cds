using {
    cuid,
    managed,
    Country
} from '@sap/cds/common';

using from '@sap/cds-common-content';


namespace bookshop;

entity Books : cuid, managed {
    title           : String(255)                @mandatory;
    subtitle        : String(255);
    price           : Integer;
    publicationDate : Date;
    stock           : Integer                    @assert.range: [
        1,
        _
    ] default 1;
    rating          : Integer                    @assert.range: [
        1,
        5
    ];
    available       : Boolean default true;

    // Relacionamento de 1:1 onde cada livro tem apenas um autor
    author          : Association to one Authors @assert.target;

    // Relacionamento N:N onde cada livro pode estar relacionado a várias categorias
    // atráves da tabela intermediária BookCategories
    navCategories   : Association to many BookCategories
                          on navCategories.book = $self
                                                 @assert.target;
}


entity Authors : cuid, managed {
    firstName : String(255) @mandatory;
    lastName  : String(255) @mandatory;

    //Relacionamento de 1:n onde um author pode estar relacionado a vários livros
    books     : Association to many Books
                    on books.author = $self
                            @assert.target;
}

entity Categories : cuid, managed {
    name     : String(255) @mandatory;

    // Relacionamento N:N onde um Categoria pode estar relacionada a vários livros
    // atráves da tabela intermediária BookCategories
    navBooks : Association to many BookCategories
                   on navBooks.category = $self
                           @assert.target;
}

//Entidade intermediária Books x Categories
entity BookCategories : cuid, managed {
    key book     : Association to Books      @assert.target;
    key category : Association to Categories @assert.target;
}

//aqui abaixo estão as novas entidades
entity Customers : cuid, managed {
    firstName : String(255) @mandatory;
    lastName  : String(255) @mandatory;

    @mandatory
    @assert.format        : '^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$'
    @assert.format.message: 'Expected format 111.222.333-24'
    cpf       : String(14);

    @assert.format        : '^[0-9]{2}-[0-9]{4,5}-[0-9]{4}$'
    @assert.format.message: 'Expected format 11-99999-8888'
    phone     : String(13);
    address   : String(255);
    city      : String(255);
    state     : String(255);
    country   : Country;

    @assert.format        : '^[0-9]{5}-[0-9]{3}$'
    @assert.format.message: 'Expected format 99888-100'
    cep       : String(9);

    orders    : Association to many Orders
                    on orders.customer = $self
                            @assert.target;
}

entity Orders : cuid, managed {
            OrderDate  : DateTime;
    virtual totalValue : Integer;
            status     : String(20)                   @assert.range enum {
                PENDING;
                PAID;
                CANCELLED;
            } default 'PENDING';

            customer   : Association to one Customers @assert.target;

            orderItems : Composition of many OrderItems
                             on orderItems.order = $self;
}

entity OrderItems : cuid, managed {
    quantity : Integer                   @mandatory;
    order    : Association to one Orders ;
    book     : Association to one Books  @assert.target;
}
