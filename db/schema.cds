namespace bookshop;

entity Books {
    key ID              : UUID;
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


entity Authors {
    key ID        : UUID;
        firstName : String(255);
        lastName  : String(255);

        //Relacionamento de 1:n onde um author pode estar relacionado a vários livros
        books     : Association to many Books
                        on books.author = $self;
}

entity Categories {
    key ID       : UUID;
        name     : String(255);

        // Relacionamento N:N onde um Categoria pode estar relacionada a vários livros
        // atráves da tabela intermediária BookCategories
        navBooks : Association to many BookCategories
                       on navBooks.category = $self;
}

//Entidade intermediária Books x Categories
entity BookCategories {
    key ID       : UUID;
    key book     : Association to Books;
    key category : Association to Categories;
}
