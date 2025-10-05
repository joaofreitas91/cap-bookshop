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
}
